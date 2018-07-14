package controller;

import tools.Common;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet(name = "UpdateCartServlet", urlPatterns = "/api/addCart")
public class HandleUpdateCart extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/text; charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String alt = request.getParameter("alt"); // alt为有图属性，不一定有
        String src = request.getParameter("src"); // src为有图属性，不一定有
        String attr = request.getParameter("attr"); // attr为无图属性，不一定有
        int userId = Integer.parseInt(request.getParameter("user_id")); // user_id一定有
        int commodityId = Integer.parseInt(request.getParameter("commodity_id")); // commodity_id一定有
        int amount = Integer.parseInt(request.getParameter("amount")); // amount一定有
        try {
            Connection con = DriverManager.getConnection(Common.url, Common.username,Common.password);
            PreparedStatement sql = con.prepareStatement("SELECT dPrice FROM commodityListItems WHERE id = ?");
            sql.setInt(1,commodityId);
            ResultSet rs = sql.executeQuery();
            double dPrice = 0;
            while (rs.next()) {
                dPrice = rs.getDouble("dPrice");
            }
            sql = con.prepareStatement("INSERT INTO cart(commodity_id,quantity,sumPrice,image,attr_with_image,attr_without_image,user_id) VALUES(?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE quantity = quantity + ?,sumPrice = sumPrice + ?");
            sql.setInt(1, commodityId);
            sql.setInt(2, amount);
            sql.setDouble(3, dPrice*amount);
            sql.setString(4, src);
            sql.setString(5, alt==null?"null":alt);
            sql.setString(6, attr==null?"null":attr);
            sql.setInt(7, userId);
            sql.setInt(8,amount);
            sql.setDouble(9,dPrice*amount);
            if(sql.executeUpdate() >= 0) {
                 out.write("OK");
            } else {
                out.write("Error");
            }
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
