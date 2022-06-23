/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author win
 */
public class Comment {
    private int id;
    private User_Info ui;
    private String cmt;
    private Date timeCmt;

    public Comment() {
    }

    public Comment(int id, User_Info ui, String cmt, Date timeCmt) {
        this.id = id;
        this.ui = ui;
        this.cmt = cmt;
        this.timeCmt = timeCmt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User_Info getUi() {
        return ui;
    }

    public void setUi(User_Info ui) {
        this.ui = ui;
    }

    public String getCmt() {
        return cmt;
    }

    public void setCmt(String cmt) {
        this.cmt = cmt;
    }

    public Date getTimeCmt() {
        return timeCmt;
    }

    public void setTimeCmt(Date timeCmt) {
        this.timeCmt = timeCmt;
    }
    
}
