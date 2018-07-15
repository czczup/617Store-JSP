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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "AddTagServlet", urlPatterns = "/api/addTag")
public class HandleAddTag extends HttpServlet {

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
        String tag = request.getParameter("tag");
        int commodityId = Integer.parseInt(request.getParameter("commodity_id"));
        try {
            Connection con = DriverManager.getConnection(Common.url, Common.username,Common.password);
            PreparedStatement sql = con.prepareStatement("SELECT count(1) as count FROM tag WHERE tag.tag=? AND tag.commodity_id=?");
            sql.setString(1, tag);
            sql.setInt(2, commodityId);
            ResultSet rs = sql.executeQuery();
            int count = 0;
            while (rs.next()) {
                count = rs.getInt("count");
            }
            sql = con.prepareStatement("INSERT INTO tag(tag,commodity_id,quantity) VALUES(?,?,?) ON DUPLICATE KEY UPDATE quantity = quantity + ?");
            sql.setString(1, tag);
            sql.setInt(2, commodityId);
            sql.setInt(3, 1);
            sql.setInt(4, 1);
            if(sql.executeUpdate() >= 0) {
                if (count == 0) {
                    out.write("Insert");
                } else {
                    out.write("Update");
                }
            } else {
                out.write("Error");
            }
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}