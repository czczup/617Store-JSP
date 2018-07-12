package tools;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class UrlFilter {
    private static String[] filterPool = {"id","status"};
    public static List<String> filter(String url) {
        List<String> afterFilter = new ArrayList<>();
        if(url!=null) {
            String[] attrList = url.split("&");
            for (int i = 0; i < attrList.length; i++) {
                if (!Arrays.asList(filterPool).contains(attrList[i].split("=")[0])) {
                    afterFilter.add(attrList[i]);
                }
            }
        }
        return afterFilter;
    }

    public static String filterLogin(String url) {
        String result;
        if(url.endsWith("status=Logout")) {
            result = url.replace("status=Logout", "");
            result = result.substring(0, result.length() - 1); // 退出登录时的url已被过滤
            System.out.println("登陆成功后重定向的url: " + result);
        } else {
            result = url;
        }
        return result;
    }
    public static String filterLogout(String url) {
        String result;
        List<String> afterFilter = filter(url);
        if(afterFilter.size()==0) {
            result = "?status=Logout";
        } else {
            result = "?"+String.join("&",afterFilter)+"&status=Logout";
        }
        System.out.println("退出按钮的url: "+result);
        return result;
    }

    public static void main(String args[]) {
        UrlFilter.filterLogout("class=%E7%94%B7");
        UrlFilter.filterLogout("id=1&page=5");
        UrlFilter.filterLogin("index.html?status=Logout");
    }
}
