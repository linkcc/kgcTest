package com.kgc.entity;

import java.io.Serializable;

public class Goodtype implements Serializable {
    private Integer goodtypeId;

    private String goodtypeName;

    public Goodtype(Integer goodtypeId, String goodtypeName) {
        this.goodtypeId = goodtypeId;
        this.goodtypeName = goodtypeName;
    }

    public Goodtype() {
        super();
    }

    public Integer getGoodtypeId() {
        return goodtypeId;
    }

    public void setGoodtypeId(Integer goodtypeId) {
        this.goodtypeId = goodtypeId;
    }

    public String getGoodtypeName() {
        return goodtypeName;
    }

    public void setGoodtypeName(String goodtypeName) {
        this.goodtypeName = goodtypeName == null ? null : goodtypeName.trim();
    }
}