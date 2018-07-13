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
import java.sql.*;

@WebServlet(name = "HandleRegister", urlPatterns = "/api/register")
public class HandleRegister extends HttpServlet {

    private User user = new User();

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
        String userName = request.getParameter("name").trim();
        String password = request.getParameter("password").trim();
        String email = request.getParameter("email").trim();
        String url = "jdbc:mysql://120.79.162.134:3306/617Store?useSSL=false&useUnicode=true&characterEncoding=utf8";
        Connection con;
        PreparedStatement sql;
        HttpSession session = request.getSession(true);
        boolean boo = userName.length() > 0 && password.length() > 0 && email.length() > 0;
        Hasher hasher = new Hasher();
        password = hasher.encode(password);
        try {
            con = DriverManager.getConnection(url,"root","abcphotovalley");
            String insertCondition = "INSERT INTO user(username,password,email) VALUES (?,?,?)";
            sql = con.prepareStatement(insertCondition);
            if (boo) {
                sql.setString(1, userName);
                sql.setString(2, password);
                sql.setString(3, email);
                if(sql.executeUpdate() != 0) {
                    sql = con.prepareStatement("SELECT id FROM user WHERE username=?");
                    sql.setString(1,userName);
                    ResultSet rs = sql.executeQuery();
                    while (rs.next()) {
                        user.setId(rs.getInt("id"));
                    }
                    user.setUsername(userName);
                    session.setAttribute("user", user);
                    con.close();
                    response.sendRedirect("/register.html?status=Success");
                }
            } else {
                response.sendRedirect("/register.html?status=Empty");
            }
            con.close();
        } catch(SQLException exp) {
            exp.printStackTrace();
            response.sendRedirect("/register.html?status=Error");
        }
    }
}
