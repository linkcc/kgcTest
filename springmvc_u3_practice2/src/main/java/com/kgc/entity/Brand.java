package com.kgc.entity;

import java.io.Serializable;

public class Brand implements Serializable {
    private Integer id;

    private String name;

    private String discription;

    private String url;

    private String logo;

    private Integer status;

    private static final long serialVersionUID = 1L;

    public Brand(Integer id, String name, String discription, String url, String logo, Integer status) {
        this.id = id;
        this.name = name;
        this.discription = discription;
        this.url = url;
        this.logo = logo;
        this.status = status;
    }

    public Brand() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription == null ? null : discription.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo == null ? null : logo.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Brand{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", discription='" + discription + '\'' +
                ", url='" + url + '\'' +
                ", logo='" + logo + '\'' +
                ", status=" + status +
                '}';
    }
}