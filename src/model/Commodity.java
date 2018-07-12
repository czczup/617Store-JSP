package model;

import java.util.Date;

public class Commodity {

    private int id;
    private String title;
    private double originalPrice;
    private double discountPrice;
    private String quickReview;
    private String overview;
    private Date date;

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

    public double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public double getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(double discountPrice) {
        this.discountPrice = discountPrice;
    }

    public String getQuickReview() {
        return quickReview;
    }

    public void setQuickReview(String quickReview) {
        this.quickReview = quickReview;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Commodity{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", originalPrice=" + originalPrice +
                ", discountPrice=" + discountPrice +
                ", quickReview='" + quickReview + '\'' +
                ", overview='" + overview + '\'' +
                ", date=" + date +
                '}';
    }
}
