package controller;

import model.CommodityListItem;
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
import java.util.*;
import java.util.Date;

@WebServlet(name = "CommodityServlet", urlPatterns = "/api/commodities")
public class HandleCommodity extends HttpServlet {
    private static List<CommodityListItem> goodsList;

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
        String queryClass = null;
        String queryKey = null;
        String queryPrice = null;
        String queryColor = null;
        String querySort = null;
        String queryString = request.getQueryString();
        System.out.println("QueryString: "+queryString);
        try {
            if(queryString != null && !queryString.equals("")) {
                String[] tempList = queryString.split("&");
                HashMap map = new HashMap();
                for (int i=0;i<tempList.length;i++) {
                    String[] temp = tempList[i].split("=");
                    map.put(temp[0],temp[1]);
                }
                if(map.get("class")!=null) {
                    queryClass = java.net.URLDecoder.decode((String)map.get("class"),"utf-8");
                }
                if(map.get("key")!=null) {
                    queryKey = java.net.URLDecoder.decode((String)map.get("key"),"utf-8");
                }
                if(map.get("price")!=null) {
                    queryPrice = java.net.URLDecoder.decode((String)map.get("price"),"utf-8");
                }
                if(map.get("color")!=null) {
                    queryColor = java.net.URLDecoder.decode((String)map.get("color"),"utf-8");
                }
                if(map.get("sort")!=null) {
                    querySort = java.net.URLDecoder.decode((String)map.get("sort"),"utf-8");
                }
            }
        } catch (Exception e) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/404.html");
            dispatcher.forward(request, response);
        }
        goodsList = doSearch(queryClass,queryKey,queryColor);
        /* 输出商品列表 */
        if(queryPrice != null) {
            goodsList = priceFilter(goodsList, queryPrice);
        }
        if(querySort != null) {
            goodsList = sortFilter(goodsList, querySort);
        }
        request.setAttribute("CommodityListItem", goodsList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/store-listing.html");
        dispatcher.forward(request, response);
    }

    public static List<CommodityListItem> doSearch(String queryClass, String queryKey, String queryColor) {
        String sql = null;
        if (queryColor == null) {
            if (queryClass == null && queryKey == null) {
                sql = "SELECT * FROM commodityListItems";
            } else if (queryClass == null && queryKey != null) { // 搜索功能
                String[] keyList = queryKey.split("/");
                sql = "SELECT * FROM commodityListItems WHERE keyword LIKE '%"+keyList[0]+"%'";
                for (int i=1;i<keyList.length;i++) {
                    sql += " OR keyword LIKE '%"+keyList[i]+"%'";
                }
            } else if (queryClass != null && queryKey == null) { // 只查询大类别
                sql = "SELECT * FROM commodityListItems WHERE keyword LIKE '%"+queryClass+"%'";
            } else if (queryClass != null && queryKey != null) {
                String[] keyList = queryKey.split("/");
                sql = "SELECT * FROM commodityListItems WHERE keyword LIKE '%"+queryClass+"%' AND (keyword LIKE '%"+keyList[0]+"%'";
                for (int i=1;i<keyList.length;i++) {
                    sql += " OR keyword LIKE '%"+keyList[i]+"%'";
                }
                sql += ")";
            }
        } else {
            if (queryClass == null && queryKey == null) {
                sql = "SELECT * FROM commodityListItems WHERE keyword LIKE '%"+queryColor+"%'";
            } else if (queryClass == null && queryKey != null) { // 搜索功能
                String[] keyList = queryKey.split("/");
                sql = "SELECT * FROM commodityListItems WHERE keyword LIKE '%"+queryColor+"%' AND keyword LIKE '%"+keyList[0]+"%'";
                for (int i=1;i<keyList.length;i++) {
                    sql += " OR keyword LIKE '%"+keyList[i]+"%'";
                }
            } else if (queryClass != null && queryKey == null) { // 只查询大类别
                sql = "SELECT * FROM commodityListItems WHERE keyword LIKE '%"+queryColor+"%' AND keyword LIKE '%"+queryClass+"%'";
            } else if (queryClass != null && queryKey != null) {
                String[] keyList = queryKey.split("/");
                sql = "SELECT * FROM commodityListItems WHERE keyword LIKE '%"+queryColor+"%' And keyword Like '%"+queryClass+"%' AND (keyword LIKE '%"+keyList[0]+"%'";
                for (int i=1;i<keyList.length;i++) {
                    sql += " OR keyword LIKE '%"+keyList[i]+"%'";
                }
                sql += ")";
            }
        }
        System.out.println(sql);
        goodsList = getCommodityList(sql);
        return goodsList;
    }

    public static List<CommodityListItem> getCommodityList(String sql){
        try{
            ResultSet rsImages;
            ResultSet rsTags;
            goodsList = new ArrayList<>();
            Connection con = DriverManager.getConnection(Common.url, Common.username,Common.password);
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                CommodityListItem item = new CommodityListItem();
                item.setId(rs.getInt("id"));
                String title = rs.getString("title");
                item.setTitle(title.length() > 12 ? title.substring(0, 11) + "…" : title);
                item.setoPrice(rs.getDouble("oPrice"));
                item.setdPrice(rs.getDouble("dPrice"));
                int days = (int) ((new Date().getTime() - rs.getDate("date").getTime()) / (1000*3600*24));
                item.setNewProduct(days < 15);
                item.setStarNum(rs.getDouble("starNum"));
                ps = con.prepareStatement("SELECT image FROM mainPicture WHERE commodity_id = ?");
                ps.setInt(1, item.getId());
                rsImages = ps.executeQuery();
                ArrayList<String> images = new ArrayList<>();
                while (rsImages.next()) {
                    images.add(rsImages.getString("image"));
                }
                item.setImages(images);
                ps = con.prepareStatement("SELECT tag FROM tagTop3 WHERE commodity_id = ?");
                ps.setInt(1, item.getId());
                rsTags = ps.executeQuery();
                ArrayList<String> tags = new ArrayList<>();
                while (rsTags.next()) {
                    tags.add(rsTags.getString("tag"));
                }
                item.setTags(tags);
                goodsList.add(item);
            }
            con.close();
            return goodsList;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    private List<CommodityListItem> priceFilter(List<CommodityListItem> goodsList, String queryPrice) {
        List<CommodityListItem> newList = new ArrayList<>();
        String[] priceList = queryPrice.split("/");
        int minPrice = Integer.parseInt(priceList[0]);
        int maxPrice = Integer.parseInt(priceList[1]);
        for(int i=0;i<goodsList.size();i++) {
            CommodityListItem good = goodsList.get(i);
            if(good.getdPrice()>=minPrice && good.getdPrice()<=maxPrice) {
                newList.add(good);
            }
        }
        return newList;
    }
    private List<CommodityListItem> sortFilter(List<CommodityListItem> goodsList, String querySort) {
        if(querySort.equals("asc")) { // 升序排序
            Collections.sort(goodsList);
        } else { // 降序排序
            Collections.sort(goodsList);
            Collections.reverse(goodsList);
        }
        return goodsList;
    }

    public static void main(String[] args) {
        HandleCommodity.doSearch("男","鞋",null);
        HandleCommodity.doSearch(null,"鞋",null);
        HandleCommodity.doSearch(null,"鞋/女",null);
        HandleCommodity.doSearch("男",null,null);
        HandleCommodity.doSearch("男","鞋/女",null);
        HandleCommodity.doSearch("男","鞋","黑");
        HandleCommodity.doSearch(null,"鞋","黑");
        HandleCommodity.doSearch(null,"鞋/女","黑");
        HandleCommodity.doSearch("男",null,"黑");
        HandleCommodity.doSearch("男","鞋/女","黑");
    }
}
