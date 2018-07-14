package controller;

import model.User;
import tools.Common;
import tools.Hasher;
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

@WebServlet(name = "HandleLogin", urlPatterns = "/api/login")
public class HandleLogin extends HttpServlet {
    private User user = new User();

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/text; charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        HttpSession session = request.getSession();
        if (check(username,password)) {
            try {
                System.out.println("HandleLogin: "+username+"登录成功");
                session.setAttribute("user",user);
                String referer = (String)session.getAttribute("referer");
                response.sendRedirect(referer);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            try {
                /* 通过参数status显示失败提示框 */
                System.out.println("HandleLogin: "+username+"登录失败");
                response.sendRedirect("/login.html?status=Error");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private boolean check(String username,String password) {
        Connection con;
        PreparedStatement sql;
        ResultSet rs;
        String queryPassword = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(Common.url, Common.username,Common.password);
            sql = con.prepareStatement("SELECT * FROM user WHERE username=?;");
            sql.setString(1,username);
            rs = sql.executeQuery();
            while (rs.next()) {
                queryPassword = rs.getString("password");
                user.setUsername(username);
                user.setId(rs.getInt("id"));
            }
            con.close();
            /* 判断加密后的密码与数据库中存储的密码是否相同 */
            if ((new Hasher()).checkPassword(password,queryPassword)) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
