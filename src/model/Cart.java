package model;

public class Cart {
    private int id;
    private int commodityId;
    private int quantity;
    private double sumPrice;
    private String image;
    private String attrWithImage;
    private String attrWithoutImage;
    private String title;
    private double price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(int commodityId) {
        this.commodityId = commodityId;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "commodityId=" + commodityId +
                ", quantity=" + quantity +
                ", sumPrice=" + sumPrice +
                ", image='" + image + '\'' +
                ", attrWithImage='" + attrWithImage + '\'' +
                ", attrWithoutImage='" + attrWithoutImage + '\'' +
                ", title='" + title + '\'' +
                ", price=" + price +
                '}';
    }
}
