
package com.tech.entities;

public class Categories {
    private int cID;
    private String cName;
    private String cDiscription;

    public Categories(int cID, String cName, String cDiscription) {
        this.cID = cID;
        this.cName = cName;
        this.cDiscription = cDiscription;
    }

//    public Categories() {
//    }
//
//    public Categories( String cName, String cDiscription) {
//        this.cName = cName;
//        this.cDiscription = cDiscription;
//    }

    public int getcID() {
        return cID;
    }

    public void setcID(int cID) {
        this.cID = cID;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcDiscription() {
        return cDiscription;
    }

    public void setcDiscription(String cDiscription) {
        this.cDiscription = cDiscription;
    }
    
    
}
