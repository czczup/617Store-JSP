package model;

import java.util.Date;
import java.util.List;

public class HistoryPayment {
    private int id;
    private Date payDate;
    private double price;
    private int quantity;
    private List<HistoryOrder> orderList;

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<HistoryOrder> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<HistoryOrder> orderList) {
        this.orderList = orderList;
    }

    @Override
    public String toString() {
        return "HistoryPayment{" +
                "payDate=" + payDate +
                ", price=" + price +
                ", orderList=" + orderList +
                '}';
    }
}
