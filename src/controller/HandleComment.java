package controller;

import model.User;
import tools.Common;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet(name = "CommentServlet", urlPatterns = "/api/addComment")
public class HandleComment extends HttpServlet {

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
        int starNum = Integer.parseInt(request.getParameter("starNum"));
        int commodityId = Integer.parseInt(request.getParameter("commodity_id"));
        String comment = request.getParameter("comment");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        PrintWriter out = response.getWriter();
        try {
            Connection con = DriverManager.getConnection(Common.url, Common.username,Common.password);
            PreparedStatement sql = con.prepareStatement("INSERT INTO comment (comment, commodity_id, user_id, star_num) VALUES (?,?,?,?)");
            sql.setString(1,comment);
            sql.setInt(2,commodityId);
            sql.setInt(3,user.getId());
            sql.setInt(4,starNum);
            if(sql.executeUpdate()>0) {
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
