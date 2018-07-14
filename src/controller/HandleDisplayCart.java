package controller;


import model.Cart;
import model.CartSimple;
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
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "HandleDisplayCart", urlPatterns = "/api/displayCart")
public class HandleDisplayCart extends HttpServlet {

    private static String url = "jdbc:mysql://120.79.162.134:3306/617Store?useSSL=false&useUnicode=true&characterEncoding=utf8";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("application/text; charset=utf-8");
        request.setCharacterEncoding("utf-8");
        try {
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("user");
            List<Cart> cartList = new ArrayList<>();
            if(user != null) {
                Connection con = DriverManager.getConnection(Common.url, Common.username,Common.password);
                PreparedStatement sql = con.prepareStatement("SELECT * FROM cartList WHERE user_id = ?");
                sql.setInt(1, user.getId());
                ResultSet rs = sql.executeQuery();
                while (rs.next()) {
                    Cart cart = new Cart();
                    cart.setId(rs.getInt("id"));
                    cart.setCommodityId(rs.getInt("commodity_id"));
                    cart.setQuantity(rs.getInt("quantity"));
                    cart.setSumPrice(rs.getDouble("sumPrice"));
                    cart.setImage(rs.getString("image"));
                    cart.setAttrWithImage(rs.getString("attr_with_image"));
                    cart.setAttrWithoutImage(rs.getString("attr_without_image"));
                    cart.setTitle(rs.getString("title"));
                    cart.setPrice(rs.getDouble("price"));
                    cartList.add(cart);
                }
                request.setAttribute("cartList",cartList);
                CartSimple cartSimple = getSimpleInfo(user.getId());
                request.setAttribute("cartSimple",cartSimple);
                con.close();
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("/store-cart.html");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static CartSimple getSimpleInfo(int userId) {
        CartSimple cart = new CartSimple();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(Common.url, Common.username,Common.password);
            PreparedStatement sql = con.prepareStatement("SELECT * FROM cartSimpleInfo WHERE user_id = ?");
            sql.setInt(1, userId);
            ResultSet rs = sql.executeQuery();
            while (rs.next()) {
                cart.setCartPrice(rs.getDouble("cart_price"));
                cart.setCartAmount(rs.getInt("cart_amount"));
            }
            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }

}
