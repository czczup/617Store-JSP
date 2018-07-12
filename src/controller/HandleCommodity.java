package controller;

import model.CommodityListItem;
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
import java.util.Date;
import java.util.List;

@WebServlet(name = "CommodityServlet", urlPatterns = "/api/commodities")
public class HandleCommodity extends HttpServlet {
    private static List<CommodityListItem> goodsList;
    private static String url = "jdbc:mysql://120.79.162.134:3306/617Store?useSSL=false&useUnicode=true&characterEncoding=utf8";

    HttpSession session = null;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException {
        session = request.getSession(true);
        goodsList = getCommodityList("SELECT * FROM commodityListItems");
        request.setAttribute("CommodityListItem", goodsList);
        System.out.println("HandleCommodity: "+goodsList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product-listing.html");
        dispatcher.forward(request, response);
    }

    public static List<CommodityListItem> getCommodityList(String sql){
        try{
            ResultSet rsImages;
            ResultSet rsTags;
            goodsList = new ArrayList<>();
            Connection con = DriverManager.getConnection(url, "root","abcphotovalley");
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                CommodityListItem item = new CommodityListItem();
                item.setId(Integer.parseInt(rs.getString("id")));
                String title =  rs.getString("title");
                item.setTitle(title.length() > 12 ? title.substring(0, 11) + "…" : title);
                item.setoPrice(Double.parseDouble(rs.getString("oPrice")));
                item.setdPrice(Double.parseDouble(rs.getString("dPrice")));
                int days = (int) ((new Date().getTime() - rs.getDate("date").getTime()) / (1000*3600*24));
                item.setNewProduct(days < 15);
                item.setStarNum(Double.parseDouble(rs.getString("starNum")));
                ps = con.prepareStatement("SELECT image FROM mainPicture WHERE commodity_id = ?");
                ps.setString(1, String.valueOf(item.getId()));
                rsImages = ps.executeQuery();
                ArrayList<String> images = new ArrayList<>();
                while (rsImages.next()) {
                    images.add(rsImages.getString("image"));
                }
                item.setImages(images);
                rsImages.close();
                ps = con.prepareStatement("SELECT tag FROM tagTop3 WHERE commodity_id = ?");
                ps.setString(1, String.valueOf(item.getId()));
                rsTags = ps.executeQuery();
                ArrayList<String> tags = new ArrayList<>();
                while (rsTags.next()) {
                    tags.add(rsTags.getString("tag"));
                }
                item.setTags(tags);
                rsTags.close();
                goodsList.add(item);
            }
            con.close();
            return goodsList;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

}
