package com.watad.philoPLus.classes;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;


public class Following {
    
     private int id ; 
     private int liftId;
     private String followingDetails;
     private Date followingDate;
     private String imgPath ; 
     private InputStream file;
     private int progressId ;
     private String progressDetails;
     private float progress_radtio ; 
     private String progress_ratio_details;
     private int userId ;
     private String userloginName;
     private String liftNum;
     private String siteName ;
    public Following() {
        
    }
     
    public Following(int id, int liftId, String followingDetails, Date followingDate,String imgPath , InputStream file,int Progress_Id , int userId) {
        this.id = id;
        this.liftId = liftId;
        this.followingDetails = followingDetails;
        this.followingDate = followingDate;
        this.imgPath = imgPath;
        this.file = file ;
        this.progressId = Progress_Id;
        this.userId = userId;
    }

    public Following(int id, String followingDetails, Date followingDate) {
        this.id = id;
        this.followingDetails = followingDetails;
        this.followingDate = followingDate;
    }

    public Following(int id, int liftId, String followingDetails, String liftNum, String siteName , String userName) {
        this.id = id;
        this.liftId = liftId;
        this.followingDetails = followingDetails;
        this.liftNum = liftNum;
        this.siteName = siteName;
        this.userloginName = userName;
    }
    
    public Following (int liftId ){
        this.liftId= liftId ;
    }

    public int getId() {
        return id;
    }
    public int getIdFromDataBase() throws SQLException{
        
        return  DataBase.autoNumber("`following-lift`", "id");
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getLiftId() {
        return liftId;
    }

    public void setLiftId(int liftId) {
        this.liftId = liftId;
    }

    public String getFollowingDetails() {
        return followingDetails;
    }

    public void setFollowingDetails(String followingDetails) {
        this.followingDetails = followingDetails;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public Date getFollowingDate() {
        return followingDate;
    }

    public void setFollowingDate(Date followingDate) {
        this.followingDate = followingDate;
    }
    
    
    public InputStream getFile() {
        return file;
    }

    public void setFile(InputStream file) {
        this.file = file;
    }

    public int getProgressId() {
        return progressId;
    }

    public void setProgressId(int ProgressId) {
        this.progressId = ProgressId;
    }

    public String getProgressDetails() {
        return progressDetails;
    }

    public void setProgressDetails(String progressDetails) {
        this.progressDetails = progressDetails;
    }

    public String getProgress_ratio_details() {
        return progress_ratio_details;
    }

    public void setProgress_ratio_details(String progress_ratio_details) {
        this.progress_ratio_details = progress_ratio_details;
    }
    
    public float getProgress_radtio() {
        return progress_radtio;
    }
    public void setProgress_radtio(float progress_radtio) {
        this.progress_radtio = progress_radtio;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserloginName() {
        return userloginName;
    }

    public void setUserloginName(String userloginName) {
        this.userloginName = userloginName;
    }

    public String getLiftNum() {
        return liftNum;
    }

    public String getSiteName() {
        return siteName;
    }
    
    
    public InputStream fileToInputStream(Part filePart) throws IOException{
 
        InputStream inputStream = null; // input stream of the upload file        
// obtains the upload file part in this multipart request
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
        return inputStream;
    }
    
    public static  int  insertNewFollowing(Following f) throws SQLException, IOException{
        return  DataBase.insertNewFollowing(f);
    }
    public  List getPerviousFollowingForLift( ) throws SQLException{
        List <Following> allLastPerviousFollowing = new ArrayList();
        ResultSet rs = DataBase.loadAllLastFollowingOfLift(getLiftId());
        while (rs.next()) {            
            int id = rs.getInt(1);
            String details = rs.getString(2);
            Date followingDate = rs.getDate(5);
            Following f = new Following(id, details, followingDate);
            allLastPerviousFollowing.add(f);
        }
              return  allLastPerviousFollowing;
    }
    
    public int deleteFollowing() throws SQLException{
        int isDeleted = DataBase.deleteFollowingRecord(getId());
        return  isDeleted;
    }
    
    public List gettingFollwingReportByDate(){
         try {
             List <Following> allFollowing = new ArrayList();
             ResultSet rs = DataBase.gettFollwingReportByDate(getFollowingDate());
             while (rs.next()) {                 
                 int id = rs.getInt(1);
                 int liftId = rs.getInt(2);
                 String liftNum = rs.getString(3);
                 String followingDetails = rs.getString(4);
                 String siteName  = rs.getString(5);
                 String userName = rs.getString(6);
                 Following f = new Following(id, liftId, followingDetails, liftNum, siteName, userName);
                 allFollowing.add(f);
             }
             return allFollowing;
         } catch (SQLException ex) {
             System.out.println(ex.getMessage());
             return null;
         }

    }
}
