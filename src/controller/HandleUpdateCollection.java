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


@WebServlet(name = "UpdateCollectionServlet", urlPatterns = "/api/updateCollection")
public class HandleUpdateCollection extends HttpServlet {

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
        int userId = Integer.parseInt(request.getParameter("user_id"));
        int commodityId = Integer.parseInt(request.getParameter("commodity_id"));
        String commend = request.getParameter("commend");
        try {
            Connection con = DriverManager.getConnection(Common.url, Common.username,Common.password);
            if( commend.equals("Cancel")) {
                PreparedStatement sql = con.prepareStatement("UPDATE collection SET status=0 WHERE user_id = ? AND commodity_id = ?");
                sql.setInt(1,userId);
                sql.setInt(2,commodityId);
                if(sql.executeUpdate() > 0) {
                    out.write("OK");
                } else {
                    out.write("Error");
                }
            } else {
                PreparedStatement sql = con.prepareStatement("INSERT INTO collection(status,user_id,commodity_id) VALUES(1,?,?) ON DUPLICATE KEY UPDATE status = 1");
                sql.setInt(1,userId);
                sql.setInt(2,commodityId);
                if(sql.executeUpdate() > 0) {
                    out.write("OK");
                } else {
                    out.write("Error");
                }
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
