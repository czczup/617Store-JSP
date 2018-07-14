package controller;

import model.*;
import tools.Common;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* 成功就显示商品，不成功显示404 */
@WebServlet(name = "ProductDetailServlet", urlPatterns = "/api/detail")
public class HandleProductDetail extends HttpServlet {

    private Connection con;
    private PreparedStatement sql;
    private ResultSet rs;
    private Commodity commodity = new Commodity();
    private Detail detail = new Detail();
    private List<CommodityListItem> goodsList;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/text; charset=utf-8");
        request.setCharacterEncoding("utf-8");
        try {
            con = DriverManager.getConnection(Common.url, Common.username,Common.password);
            String id = request.getParameter("id").trim();
            getCommodity(id);
            getTag(id);
            getImage(id);
            getComment(id);
            getStarNum(id);
            getParameterWithImage(id);
            getParameterWithoutImage(id);
            request.setAttribute("detail",detail);
            getRecommendList();
            con.close();
            request.setAttribute("CommodityListItem", goodsList);
            RequestDispatcher dispatcher;
            if(commodity.getId()==Integer.parseInt(id)) {
                dispatcher = request.getRequestDispatcher("/store-detail.html");
            } else {
                dispatcher = request.getRequestDispatcher("/404.html");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void getCommodity(String id){
        try {
            sql = con.prepareStatement("SELECT * FROM commodity WHERE id=?;");
            sql.setString(1, id);
            rs = sql.executeQuery();
            while (rs.next()) {
                commodity.setId(rs.getInt("id"));
                commodity.setTitle(rs.getString("title"));
                commodity.setOriginalPrice(rs.getDouble("original_price"));
                commodity.setDiscountPrice(rs.getDouble("discount_price"));
                commodity.setQuickReview((rs.getString("quick_review")).replace(",","，"));
                commodity.setOverview(rs.getString("overview"));
                commodity.setDate(rs.getDate("date"));
            }
            detail.setCommodity(commodity);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void getTag(String id) {
        try {
            sql = con.prepareStatement("SELECT * FROM tagTop3 WHERE commodity_id=?;");
            sql.setString(1, id);
            rs = sql.executeQuery();
            List<String> tags = new ArrayList<>();
            while (rs.next()) {
                tags.add(rs.getString("tag"));
            }
            detail.setTags(tags);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void getImage(String id) {
        try {
            sql = con.prepareStatement("SELECT * FROM mainPicture WHERE commodity_id=?;");
            sql.setString(1, id);
            rs = sql.executeQuery();
            List<String> images = new ArrayList<>();
            while (rs.next()) {
                images.add(rs.getString("image"));
            }
            detail.setImages(images);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void getComment(String id) {
        try {
            sql = con.prepareStatement("SELECT * FROM commentAndUser WHERE commodity_id=?;");
            sql.setString(1, id);
            rs = sql.executeQuery();
            List<Comment> comments = new ArrayList<>();
            while (rs.next()) {
                Comment comment = new Comment();
                User user = new User();
                comment.setId(rs.getInt("id"));
                comment.setComment(rs.getString("comment").replace(',','，'));
                comment.setPostDate(rs.getDate("post_date"));
                comment.setStarNum(rs.getInt("star_num"));
                user.setUsername(rs.getString("username"));
                user.setAvatar(rs.getString("avatar"));
                comment.setUser(user);
                comments.add(comment);
            }
            detail.setComments(comments);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void getStarNum(String id) {
        try {
            sql = con.prepareStatement("SELECT * FROM starNum WHERE commodity_id=?;");
            sql.setString(1, id);
            rs = sql.executeQuery();
            while (rs.next()) {
                detail.setStarNum(rs.getDouble("star"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void getParameterWithImage(String id) {
        try {
            sql = con.prepareStatement("SELECT * FROM paramWithImage WHERE commodity_id=?;");
            sql.setString(1, id);
            rs = sql.executeQuery();
            HashMap paramWithImage = new HashMap();
            HashMap map = null;
            while (rs.next()) {
                String attribute = rs.getString("attribute");
                if (paramWithImage.get(attribute)==null) {
                    map = new HashMap();
                    paramWithImage.put(attribute,map);
                }
                map.put(rs.getString("value"),rs.getString("image"));
            }
            detail.setParamWithImage(paramWithImage);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void getParameterWithoutImage(String id) {
        try {
            sql = con.prepareStatement("SELECT * FROM paramWithoutImage WHERE commodity_id=? ORDER BY `value`;");
            sql.setString(1, id);
            rs = sql.executeQuery();
            HashMap paramWithoutImage = new HashMap();
            List<String> list = null;
            while (rs.next()) {
                String attribute = rs.getString("attribute");
                if (paramWithoutImage.get(attribute)==null) {
                    list = new ArrayList<>();
                    paramWithoutImage.put(attribute,list);
                }
                list.add(rs.getString("value"));
            }
            detail.setParamWithoutImage(paramWithoutImage);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getRecommendList(){
        goodsList = HandleCommodity.getCommodityList("SELECT * FROM commodityListItems LIMIT 5");
    }

    public static boolean getIsCollection(int id, int userId){
        boolean result = false;
        try {
            Connection con = DriverManager.getConnection(Common.url, Common.username,Common.password);
            PreparedStatement sql = con.prepareStatement("SELECT count(1) as result FROM collectionListItems WHERE id=? AND user_id=?;");
            sql.setInt(1, id);
            sql.setInt(2, userId);
            ResultSet rs = sql.executeQuery();
             // 表示没有被收藏
            while (rs.next()) {
                result = rs.getBoolean("result");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
