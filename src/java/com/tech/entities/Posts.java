
package com.tech.entities;

import java.sql.Timestamp;

public class Posts {
    private int pId;
    private String pTitle;
    private String pContent;
    private String pCode;
    private String pic;
//    private Ti pDate;
    private Timestamp pDate; 
    private int catID;
    private int userID;

    public Posts(int pId, String pTitle, String pContent, String pCode, String pic, Timestamp pDate , int catId,int userId) {
        this.pId = pId;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pic = pic;
        this.pDate = pDate;
        this.catID=catId;
        this.userID = userId;
    }

    public Posts(String pTitle, String pContent, String pCode, String pic, Timestamp pDate , int catId,int userId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pic = pic;
        this.pDate = pDate;
        this.catID=catId;
        this.userID = userId;
    }

    public Posts() {
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatID() {
        return catID;
    }

    public void setCatID(int catID) {
        this.catID = catID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
    
    
}
