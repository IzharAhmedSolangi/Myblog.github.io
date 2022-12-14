/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.helper;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 *
 * @author Dell
 */
public class Helper {
    
    public static boolean saveFile(InputStream is , String path)
    {
    boolean flag =false;
    
        try {
            byte[] b = new byte[is.available()];
            is.read(b);
        try (FileOutputStream fos = new FileOutputStream(path)) {
            fos.write(b);
            fos.flush();
        }
            flag = true;
            
        } catch (IOException e) {
            System.out.println(e);
        }
    
    
    
    return flag;
    }
    
    
    public static boolean deleteFile(String path){
    boolean flag = false;
        
        try {
            File file = new File(path);
            flag = file.delete();
        } catch (Exception e) {
            System.out.println(e);
        }
    
    return flag;
    }
    
    
    
    
       
}
