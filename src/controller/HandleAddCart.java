package controller;

import model.User;
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


@WebServlet(name = "HandleAddCart", urlPatterns = "/api/addCart")
public class HandleAddCart extends HttpServlet {

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
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        HttpSession session = request.getSession();

    }

    private boolean check(String username,String password) {
        Connection con;
        PreparedStatement sql;
        ResultSet rs;
        String url = "jdbc:mysql://120.79.162.134:3306/617Store?useSSL=false&useUnicode=true&characterEncoding=utf8";
        try{
            con = DriverManager.getConnection(url,"root","abcphotovalley");
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
