package model;

import java.util.ArrayList;

public class CommodityListItem {

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
}
