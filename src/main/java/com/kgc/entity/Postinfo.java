package com.kgc.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Postinfo {
    private Integer id;

    private String title;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date posttime;

    private Integer clicknum;

    private String content;

    private Integer topicid;

    private String pic;

//    private Topic topic;
    private String topicname;

    public String getTopicname() {
        return topicname;
    }

    public void setTopicname(String topicname) {
        this.topicname = topicname;
    }

    public Postinfo(Integer id, String title, Date posttime, Integer clicknum, String content, Integer topicid, String pic, String topicname) {
        this.id = id;
        this.title = title;
        this.posttime = posttime;
        this.clicknum = clicknum;
        this.content = content;
        this.topicid = topicid;
        this.pic = pic;
        this.topicname = topicname;
    }

    public Postinfo(Integer id, String title, Date posttime, Integer clicknum, String content, Integer topicid, String pic) {
        this.id = id;
        this.title = title;
        this.posttime = posttime;
        this.clicknum = clicknum;
        this.content = content;
        this.topicid = topicid;
        this.pic = pic;
    }



    public Postinfo() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getPosttime() {
        return posttime;
    }

    public void setPosttime(Date posttime) {
        this.posttime = posttime;
    }

    public Integer getClicknum() {
        return clicknum;
    }

    public void setClicknum(Integer clicknum) {
        this.clicknum = clicknum;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getTopicid() {
        return topicid;
    }

    public void setTopicid(Integer topicid) {
        this.topicid = topicid;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    @Override
    public String toString() {
        return "Postinfo{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", posttime=" + posttime +
                ", clicknum=" + clicknum +
                ", content='" + content + '\'' +
                ", topicid=" + topicid +
                ", pic='" + pic + '\'' +
                ", topicname='" + topicname + '\'' +
                '}';
    }
}