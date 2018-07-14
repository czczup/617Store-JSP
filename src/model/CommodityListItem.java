package model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CommodityListItem implements Comparable<CommodityListItem>{

    private int id;

    private String title;

    private double oPrice;

    private double dPrice;

    private boolean newProduct;

    private double starNum;

    private String discount;

    private ArrayList<String> images;

    private ArrayList<String> tags;

    private boolean isDiscount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getoPrice() {
        return oPrice;
    }

    public void setoPrice(double oPrice) {
        this.oPrice = oPrice;
    }

    public double getdPrice() {
        return dPrice;
    }

    public void setdPrice(double dPrice) {
        this.dPrice = dPrice;
    }

    public boolean isNewProduct() {
        return newProduct;
    }

    public void setNewProduct(boolean newProduct) {
        this.newProduct = newProduct;
    }

    public double getStarNum() {
        return starNum;
    }

    public void setStarNum(double starNum) {
        this.starNum = starNum;
    }

    public String getDiscount() {
        discount = "-" + String.format("%.0f", (oPrice - dPrice) / oPrice * 100) + "%";
        return discount;
    }

    public ArrayList<String> getImages() {
        return images;
    }

    public void setImages(ArrayList<String> images) {
        this.images = images;
    }

    public ArrayList<String> getTags() {
        return tags;
    }

    public void setTags(ArrayList<String> tags) {
        this.tags = tags;
    }

    public boolean isDiscount() {
        isDiscount = oPrice != dPrice;
        return isDiscount;
    }

    @Override
    public String toString() {
        return "CommodityListItem{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", oPrice=" + oPrice +
                ", dPrice=" + dPrice +
                ", newProduct=" + newProduct +
                ", starNum=" + starNum +
                ", discount='" + discount + '\'' +
                ", images=" + images +
                ", tags=" + tags +
                ", isDiscount=" + isDiscount +
                '}';
    }

    @Override
    public int compareTo(CommodityListItem item) {
        if (this.dPrice >= item.dPrice) {
            return 1;
        } else {
            return -1;
        }
    }

    public static void main(String[] args) {
        CommodityListItem item1 = new CommodityListItem();
        item1.setdPrice(100);
        CommodityListItem item2 = new CommodityListItem();
        item2.setdPrice(50);
        CommodityListItem item3 = new CommodityListItem();
        item3.setdPrice(45);
        CommodityListItem item4 = new CommodityListItem();
        item4.setdPrice(257);
        List<CommodityListItem> list = new ArrayList<>();
        list.add(item1);
        list.add(item2);
        list.add(item3);
        list.add(item4);
        Collections.sort(list);
        for(CommodityListItem item:list){
            System.out.println(item);
        }






    }
}
