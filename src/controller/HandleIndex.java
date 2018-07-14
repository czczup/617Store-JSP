package controller;

import model.CommodityListItem;
import model.Slider;
import tools.Common;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HandleIndex", urlPatterns = "/api/index")
public class HandleIndex extends HttpServlet {
    private static String url = "jdbc:mysql://120.79.162.134:3306/617Store?useSSL=false&useUnicode=true&characterEncoding=utf8";
    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

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
        getSlider(request);
        getRecommendList(request);
        getRankList(request);
        getDiscountList(request);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/store-index.html");
        dispatcher.forward(request, response);
    }

    private void getSlider(HttpServletRequest request) {
        try{
            Connection con = DriverManager.getConnection(Common.url, Common.username,Common.password);
            ps = con.prepareStatement("SELECT * FROM slider");
            rs = ps.executeQuery();
            List<Slider> sliderList = new ArrayList<>();
            while(rs.next()){
                Slider slider = new Slider();
                slider.setId(rs.getInt("id"));
                slider.setTitle(rs.getString("title"));
                slider.setSubtitle(rs.getString("subtitle"));
                slider.setDescription(rs.getString("description"));
                slider.setImage(rs.getString("image"));
                slider.setCommodityID(rs.getInt("commodity_id"));
                slider.setColor(rs.getString("color"));
                sliderList.add(slider);
            }
            con.close();
            request.setAttribute("sliderList", sliderList);
            System.out.println("HandleIndex: sliderList加载成功");
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    private void getRecommendList(HttpServletRequest request) {
        List<CommodityListItem> recommendList = HandleCommodity.getCommodityList("SELECT * FROM commodityListItems ORDER BY -starNum LIMIT 8");
        request.setAttribute("recommendList",recommendList);
        System.out.println("HandleIndex: recommendList加载成功");
    }

    private void getRankList(HttpServletRequest request) {
        List<CommodityListItem> rankList = HandleCommodity.getCommodityList("SELECT * FROM commodityListItems ORDER BY -sale_volume LIMIT 6");
        request.setAttribute("rankList",rankList);
        System.out.println("HandleIndex: rankList加载成功");
    }

    private void getDiscountList(HttpServletRequest request) {
        List<CommodityListItem> discountList = HandleCommodity.getCommodityList("SELECT * FROM commodityListItems WHERE oPrice!=dPrice LIMIT 4");
        request.setAttribute("discountList",discountList);
        System.out.println("HandleIndex: discountList");
    }
}
