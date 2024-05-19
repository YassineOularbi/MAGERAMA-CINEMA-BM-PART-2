package jee.javapack.dto;

import java.math.BigDecimal;

public class RatingCount {
    private Integer rating;
    private long count;

    private BigDecimal percent;

    public RatingCount(Integer rating, long count, BigDecimal percent) {
        this.rating = rating;
        this.count = count;
        this.percent = percent;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public BigDecimal getPercent() {
        return percent;
    }

    public void setPercent(BigDecimal percent) {
        this.percent = percent;
    }
}
