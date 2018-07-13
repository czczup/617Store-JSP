package model;

public class CartSimple {
    private double cartPrice;
    private int cartAmount;

    public double getCartPrice() {
        return cartPrice;
    }

    public void setCartPrice(double cartPrice) {
        this.cartPrice = cartPrice;
    }

    public int getCartAmount() {
        return cartAmount;
    }

    public void setCartAmount(int cartAmount) {
        this.cartAmount = cartAmount;
    }

    @Override
    public String toString() {
        return "CartSimple{" +
                "cartPrice=" + cartPrice +
                ", cartAmount=" + cartAmount +
                '}';
    }
}
