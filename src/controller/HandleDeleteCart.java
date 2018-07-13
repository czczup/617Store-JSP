package controller;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet(name = "HandleDeleteCart", urlPatterns = "/api/deleteCart")
public class HandleDeleteCart extends HttpServlet {

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
        String url = "jdbc:mysql://120.79.162.134:3306/617Store?useSSL=false&useUnicode=true&characterEncoding=utf8";
        response.setContentType("application/text; charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("cartId"));
        try {
            Connection con = DriverManager.getConnection(url,"root","abcphotovalley");
            PreparedStatement sql = con.prepareStatement("DELETE FROM cart WHERE id = ?");
            sql.setInt(1,id);
            if(sql.executeUpdate() > 0) {
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
