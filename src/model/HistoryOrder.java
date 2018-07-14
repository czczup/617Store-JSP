package model;

public class HistoryOrder {
    private int commodityId;
    private String title;
    private String image;
    private int quantity;
    private double sumPrice;
    private String attrWithImage;
    private String attrWithoutImage;
    private double price;

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(int commodityId) {
        this.commodityId = commodityId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSumPrice() {
        return sumPrice;
    }

    public void setSumPrice(double sumPrice) {
        this.sumPrice = sumPrice;
    }

    public String getAttrWithImage() {
        return attrWithImage;
    }

    public void setAttrWithImage(String attrWithImage) {
        this.attrWithImage = attrWithImage;
    }

    public String getAttrWithoutImage() {
        return attrWithoutImage;
    }

    public void setAttrWithoutImage(String attrWithoutImage) {
        this.attrWithoutImage = attrWithoutImage;
    }

    @Override
    public String toString() {
        return "HistoryOrder{" +
                "commodityId=" + commodityId +
                ", title='" + title + '\'' +
                ", quantity=" + quantity +
                ", sumPrice=" + sumPrice +
                ", attrWithImage='" + attrWithImage + '\'' +
                ", attrWithoutImage='" + attrWithoutImage + '\'' +
                '}';
    }
}
