
package com.tech.entities;

import java.sql.Timestamp;

public class User {
    private int id;
    private String Name;
    private String email;
    private String Password;
    private String gender;
    private Timestamp dateTime;
    private String about;
    private String profile;

    public User(int id, String Name, String email, String Password, String gender, Timestamp dateTime, String about) {
        this.id = id;
        this.Name = Name;
        this.email = email;
        this.Password = Password;
        this.gender = gender;
        this.dateTime = dateTime;
        this.about = about;
    }

    public User() {
    }

    public User(String Name, String email, String Password, String gender,  String about) {
        this.Name = Name;
        this.email = email;
        this.Password = Password;
        this.gender = gender;      
        this.about = about;
    }
    
    
    
    
    
    
//    GETTERS AND SETTERS 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
 
}
