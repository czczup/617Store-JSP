package controller;

import model.HistoryOrder;
import model.HistoryPayment;
import model.User;
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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HistoryPaymentServlet", urlPatterns = "/api/history")
public class HandleHistoryPayment extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if (user != null) {
            List<HistoryPayment> historyPaymentList = getHistoryPayment(user.getId());
            request.setAttribute("historyPaymentList",historyPaymentList);
        }
        System.out.println("数据库查询正常");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/store-history.html");
        dispatcher.forward(request, response);
    }

    private List<HistoryPayment> getHistoryPayment(int userId) {
        List<HistoryPayment> historyPaymentList = null;
        try {
            Connection con = DriverManager.getConnection(Common.url, Common.username,Common.password);
            PreparedStatement ps = con.prepareStatement("SELECT * FROM historypayment WHERE user_id=? ORDER BY pay_date DESC");
            ps.setInt(1,userId);
            ResultSet rs = ps.executeQuery();
            historyPaymentList = new ArrayList<>();
            while (rs.next()) {
                HistoryPayment historyPayment = new HistoryPayment();
                historyPayment.setQuantity(rs.getInt("quantity"));
                historyPayment.setId(rs.getInt("id"));
                historyPayment.setPayDate(rs.getDate("pay_date"));
                historyPayment.setPrice(rs.getDouble("price"));
                int paymentId = rs.getInt("id");

                PreparedStatement ps2 = con.prepareStatement("SELECT * FROM historyOrder WHERE user_id=? AND payment_id=?");
                ps2.setInt(1,userId);
                ps2.setInt(2,paymentId);
                ResultSet rs2 = ps2.executeQuery();
                List<HistoryOrder> historyOrderList = new ArrayList<>();
                while(rs2.next()) {
                    HistoryOrder order = new HistoryOrder();
                    order.setImage(rs2.getString("image"));
                    order.setCommodityId(rs2.getInt("commodity_id"));
                    order.setSumPrice(rs2.getDouble("sumPrice"));
                    order.setTitle(rs2.getString("title"));
                    order.setQuantity(rs2.getInt("quantity"));
                    order.setAttrWithImage(rs2.getString("attr_with_image"));
                    order.setAttrWithoutImage(rs2.getString("attr_without_image"));
                    order.setPrice(rs2.getDouble("discount_price"));
                    historyOrderList.add(order);
                }
                historyPayment.setOrderList(historyOrderList);
                historyPaymentList.add(historyPayment);
            }
            con.close();
            System.out.println(historyPaymentList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return historyPaymentList;
    }
}
