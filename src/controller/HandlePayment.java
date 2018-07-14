package controller;

import model.User;
import model.HistoryOrder;
import tools.Common;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HandlePayment", urlPatterns = "/api/payment")
public class HandlePayment extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("application/text; charset=utf-8");
        request.setCharacterEncoding("utf-8");
        try {
             HttpSession session = request.getSession();
             User user = (User)session.getAttribute("user");
             if(user != null) {
                 Connection con = DriverManager.getConnection(Common.url, Common.username,Common.password);
                 int rowId = CreatePayment(con, user.getId());
                 AddOrderForm(con, user.getId(), rowId);
                 RemoveCart(con, user.getId());
                 List<HistoryOrder> historyOrderList = ShowOrderForm(con, user.getId(), rowId);
                 double historySumPrice = 0;
                 for(int i=0;i<historyOrderList.size();i++) {
                     historySumPrice += historyOrderList.get(i).getSumPrice();
                 }
                 request.setAttribute("historySumPrice",historySumPrice);
                 request.setAttribute("historyOrderList",historyOrderList);
                 con.close();
                 if(historyOrderList.size()!=0) {
                     RequestDispatcher dispatcher = request.getRequestDispatcher("/store-payment.html");
                     dispatcher.forward(request, response);
                 }
             }
             RequestDispatcher dispatcher = request.getRequestDispatcher("/404.html");
             dispatcher.forward(request, response);
        } catch (Exception e) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/404.html");
            dispatcher.forward(request, response);
        }
    }
    private int CreatePayment(Connection con, int userId) throws SQLException {
        PreparedStatement ps = con.prepareStatement("INSERT INTO payment (user_id,price) VALUES (?,(SELECT cart_price FROM cartSimpleInfo WHERE user_id=?))");
        ps.setInt(1,userId);
        ps.setInt(2,userId);
        ps.executeUpdate();
        ps = con.prepareStatement("SELECT LAST_INSERT_ID() as id;");
        ResultSet rs = ps.executeQuery();
        int rowId = -1;
        while (rs.next()) {
            rowId = rs.getInt("id");
        }
        return rowId;
    }
    private void AddOrderForm(Connection con, int userId, int rowId) throws SQLException {
        PreparedStatement ps = con.prepareStatement("INSERT INTO orderform (commodity_id, quantity, sumPrice, image, attr_with_image, attr_without_image,payment_id) " +
                "SELECT cart.commodity_id,cart.quantity,cart.sumPrice,cart.image,cart.attr_with_image,cart.attr_without_image,? " +
                "FROM cart WHERE user_id=?;");
        ps.setInt(1,rowId);
        ps.setInt(2,userId);
        ps.executeUpdate();
    }

    private void RemoveCart(Connection con, int userId) throws SQLException {
        PreparedStatement ps = con.prepareStatement("DELETE FROM cart WHERE user_id=?;");
        ps.setInt(1,userId);
        ps.executeUpdate();
    }

    private List<HistoryOrder> ShowOrderForm(Connection con, int userId, int rowId) throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM historyOrder WHERE user_id=? AND payment_id=?;");
        ps.setInt(1,userId);
        ps.setInt(2,rowId);
        ResultSet rs = ps.executeQuery();
        List<HistoryOrder> historyOrderList = new ArrayList<>();
        while (rs.next()) {
            HistoryOrder orderItem = new HistoryOrder();
            orderItem.setCommodityId(rs.getInt("commodity_id"));
            orderItem.setTitle(rs.getString("title"));
            orderItem.setQuantity(rs.getInt("quantity"));
            orderItem.setSumPrice(rs.getDouble("sumPrice"));
            orderItem.setAttrWithImage(rs.getString("attr_with_image"));
            orderItem.setAttrWithoutImage(rs.getString("attr_without_image"));
            historyOrderList.add(orderItem);
        }
        return historyOrderList;
    }
}
