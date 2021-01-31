package com.kgc.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Good implements Serializable {
    private Integer goodId;

    private String goodName;

    private Double goodPrice;

    private Integer goodNum;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createDate;

    private Integer goodtypeId;

    private Goodtype goodtype;

    public Good(Integer goodId, String goodName, Double goodPrice, Integer goodNum, Date createDate, Integer goodtypeId) {
        this.goodId = goodId;
        this.goodName = goodName;
        this.goodPrice = goodPrice;
        this.goodNum = goodNum;
        this.createDate = createDate;
        this.goodtypeId = goodtypeId;
    }

    public Good() {
        super();
    }

    public Goodtype getGoodtype() {
        return goodtype;
    }

    public void setGoodtype(Goodtype goodtype) {
        this.goodtype = goodtype;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName == null ? null : goodName.trim();
    }

    public Double getGoodPrice() {
        return goodPrice;
    }

    public void setGoodPrice(Double goodPrice) {
        this.goodPrice = goodPrice;
    }

    public Integer getGoodNum() {
        return goodNum;
    }

    public void setGoodNum(Integer goodNum) {
        this.goodNum = goodNum;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getGoodtypeId() {
        return goodtypeId;
    }

    public void setGoodtypeId(Integer goodtypeId) {
        this.goodtypeId = goodtypeId;
    }

    @Override
    public String toString() {
        return "Good{" +
                "goodId=" + goodId +
                ", goodName='" + goodName + '\'' +
                ", goodPrice=" + goodPrice +
                ", goodNum=" + goodNum +
                ", createDate=" + createDate +
                ", goodtypeId=" + goodtypeId +
                '}';
    }
}