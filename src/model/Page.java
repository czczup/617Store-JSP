package model;

public class Page {
    private int lastPage;
    private int thisPage;
    private int nextPage;
    private int nextNextPage;
    private int nextNextNextPage;

    public int getNextNextNextPage() {
        return nextNextNextPage;
    }

    public void setNextNextNextPage(int nextNextNextPage) {
        this.nextNextNextPage = nextNextNextPage;
    }

    public int getNextNextPage() {
        return nextNextPage;
    }

    public void setNextNextPage(int nextNextPage) {
        this.nextNextPage = nextNextPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public int getThisPage() {
        return thisPage;
    }

    public void setThisPage(int thisPage) {
        this.thisPage = thisPage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    @Override
    public String toString() {
        return "Page{" +
                "lastPage=" + lastPage +
                ", thisPage=" + thisPage +
                ", nextPage=" + nextPage +
                ", nextNextPage=" + nextNextPage +
                '}';
    }
}
