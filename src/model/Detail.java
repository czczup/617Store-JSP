package model;

import java.util.HashMap;
import java.util.List;

public class Detail{
    private Commodity commodity;
    private List<String> images;
    private List<String> tags;
    private List<Tag> allTags;
    private List<Comment> comments;
    private double starNum;
    private HashMap paramWithImage;
    private HashMap paramWithoutImage;

    public List<Tag> getAllTags() {
        return allTags;
    }

    public void setAllTags(List<Tag> allTags) {
        this.allTags = allTags;
    }

    public HashMap getParamWithoutImage() {
        return paramWithoutImage;
    }

    public void setParamWithoutImage(HashMap paramWithoutImage) {
        this.paramWithoutImage = paramWithoutImage;
    }

    public HashMap getParamWithImage() {
        return paramWithImage;
    }

    public void setParamWithImage(HashMap paramWithImage) {
        this.paramWithImage = paramWithImage;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public double getStarNum() {
        return starNum;
    }

    public void setStarNum(double starNum) {
        this.starNum = starNum;
    }

    @Override
    public String toString() {
        return "Detail{" +
                "commodity=" + commodity +
                ", images=" + images +
                ", tags=" + tags +
                ", comments=" + comments +
                ", starNum=" + starNum +
                ", paramWithImage=" + paramWithImage +
                ", paramWithoutImage=" + paramWithoutImage +
                '}';
    }
}
