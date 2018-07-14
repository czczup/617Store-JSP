package controller;

import model.CommodityListItem;
import model.User;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CollectionServlet", urlPatterns = "/api/collection")
public class HandleCollection extends HttpServlet {
    private List<CommodityListItem> collectionList;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/text; charset=utf-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        try {
            User user;
            try {
                user = (User) session.getAttribute("user");
                int id = user.getId();
                getCollectionList(id);
                request.setAttribute("collectionList", collectionList);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/product-collection.html");
                dispatcher.forward(request, response);
            } catch (NullPointerException e) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/product-collection.html");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void getCollectionList(int id){
        collectionList = HandleCommodity.getCommodityList("SELECT * FROM collectionListItems WHERE user_id="+id);
    }
}
