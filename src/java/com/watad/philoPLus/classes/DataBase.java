
package com.watad.philoPLus.classes;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Optional;
import javafx.geometry.NodeOrientation;
import javafx.scene.control.Alert;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Label;
import javax.imageio.ImageIO;
import javax.swing.JOptionPane;


public class DataBase {
    
     static  String url = ""; // to contain the url for date base
     static String database_name = "philo-plus";//to contain database name 
     static Connection connection;  // the variable that is make connection betwen database and java
     static void setUrl() {//to intialize the url of date base 

        url = "jdbc:mysql://localhost:3306/" + database_name
                + "?useUnicode=true&characterEncoding=UTF-8";
    }

  
    public void setDatebaseName(String databaseName) { // to set new database 

        database_name = databaseName;
    }
    public  Connection getConnection (){
        return  connection ;
    }
    public  static void setConection() {//to intializ my conection for date base usring url , username , paseword
        try {
             Class.forName("com.mysql.jdbc.Driver");
            setUrl();
            connection = DriverManager.getConnection(url, "root", "");
        } catch (SQLException ex) {
            JOptionPane.showConfirmDialog(null, ex.getMessage());
        }  catch (ClassNotFoundException ex) {
             System.out.println("Eception :"+ex.getMessage());
           }
    }
    
    
    //== >  Start utilites functions that serve  database functions

    // function return the largest value in column to make auto number by add one to the largest value 
    public static int autoNumber(String tableName, String columnName) throws SQLException                                                        {

        int autoNumber = 1; //intial with 1 if table is empty
      
             setConection();
             //sql querey to get the max value in any column in any tabel
             String sql ="SELECT MAX("+columnName+") AS "+columnName+" from "+tableName +" having Max("+columnName+") is not null";
             Statement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery(sql);
             while (resultSet.next()) { // if return empty value  this means the table is empty  so put auto number = 1              
                   int  currentMax = resultSet.getInt(columnName); // max value in column 
                   autoNumber =currentMax +1 ; // why we addded one to autop number variable ? cause max function return max value but i want add new row with new value = max value + 1
             }
            connection.close();
         
             return autoNumber;
        
        }
    
    //== >  End utilites functions that serve  data base functions
    
    
    
  // Start page of creating getting data from database to <select> tag for comapnies an liftTypes
    
    // function to retive all liftTypes names and id 
       public static ResultSet gettingAllLiftType()throws SQLException{      
            setConection();
            String sql = "select id , `lift-type-details` from `lift-type` ";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            return  rs; 
            }
       
    //fumction to retrive all campanies name and id 
        public static ResultSet gettingAllCampaniesName () throws SQLException{
        setConection();
               String sql = "SELECT `id` , `company-name` FROM `companies`";
               PreparedStatement statement = connection.prepareStatement(sql);
               ResultSet resultSet = statement.executeQuery();
               return resultSet;
      }
         public static ResultSet gettingAllSitesName ()throws SQLException{
          setConection();
               String sql = "SELECT `id`,`site-name` FROM `sites`";
               PreparedStatement statement = connection.prepareStatement(sql);
               ResultSet resultSet = statement.executeQuery();
               return resultSet;
          }
        // End page of creating getting data from database to <select> tag for comapnies an liftTypes
         
         
    // user login 
         public static ResultSet checkValidalityLogin(String name , String password)throws SQLException{
         
             setConection();
             String sql = "SELECT * FROM `users`  where `userName` = ? and `paswword` = ? ";
             PreparedStatement ps = connection.prepareStatement(sql);
             ps.setString(1, name);
             ps.setString(2, password);
             return ps.executeQuery();
         }
         
         public static int getUserId (String userName){
             setConection();
               int userId = 0 ;
             try{
             String sql = "SELECT id FROM `users` WHERE userName = ? ";
             PreparedStatement ps =  connection.prepareStatement(sql);
             ps.setString(1, userName);
             ResultSet rs = ps.executeQuery();
                 while (rs.next()) {                     
                     userId = rs.getInt(1);
                 }
                 return userId;
             }catch(SQLException ex){
                 System.out.println(ex.getMessage());
                 return userId;
             }
         }
    // end user login 
         
         // create lifts
          public static int insertNewLift(Lift newOne)throws SQLException{
        
        setConection();
        String sql ="INSERT INTO `our-lifts`(`id`, `po`, `lift-num`, `lift-type-id`, `lift-floor-num`, `lift-well-num`, `start-work`, `num-work-day`, `site-id`, `company-id`) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, newOne.getId());
        ps.setString(2, newOne.getPo());
        ps.setString(3, newOne.getLiftNum());
        ps.setInt(4, newOne.getLift_type_id());
        ps.setInt(5, newOne.getLift_floor_number());
        ps.setInt(6, newOne.getLift_well_num());
        ps.setDate(7, newOne.getStartWork());
        ps.setInt(8, newOne.getNum_work_day());
        ps.setInt(9, newOne.getSiteId());
        ps.setInt(10, newOne.getCompanyID());
       return ps.executeUpdate();       
    }
            // loadAllSavedCreatedLifts
    public static  ResultSet loadAllSavedLifts(int startRange , int endRange) throws SQLException{
        setConection();
        String sql = "SELECT `our-lifts`.`id` , `lift-num` , `sites`.`site-name` from `our-lifts` LEFT JOIN `sites`\n" +
                            "on `our-lifts`.`site-id` = `sites`.`id` ORDER by id DESC limit ? , ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, startRange);
            ps.setInt(2, endRange);
            return  ps.executeQuery();
    }
    public static int numOfSavedLifts(){
        try {
            setConection();
            String sql = "SELECT count(id) from `our-lifts` ";
            PreparedStatement ps = connection.prepareStatement(sql);
            int num = 0 ;
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                num = rs.getInt(1);
            }
            return num;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
        
    }
        public static int deleteLift(int id ) throws SQLException{
        setConection(); 
        String sql = "delete from `our-lifts` where id = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        return  ps.executeUpdate();
    }
     public static int editLiftData( Lift updatedOne)throws SQLException{
        setConection();
        String sql = "UPDATE `our-lifts` SET `po`= ?,`lift-num`= ?,`lift-type-id`= ?,`lift-floor-num`= ?,"
                + "`lift-well-num`= ?,`start-work`= ?,`num-work-day`= ?,`site-id`= ?,`company-id`= ? WHERE id = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, updatedOne.getPo());
        ps.setString(2, updatedOne.getLiftNum());
        ps.setInt(3, updatedOne.getLift_type_id());
        ps.setInt(4, updatedOne.getLift_floor_number());
        ps.setInt(5, updatedOne.getLift_well_num());
        ps.setDate(6, updatedOne.getStartWork());
        ps.setInt(7, updatedOne.getNum_work_day());
        ps.setInt(8, updatedOne.getSiteId());
        ps.setInt(9, updatedOne.getSiteId());
        ps.setInt(10, updatedOne.getId());
        return ps.executeUpdate();
    }
        public static ResultSet gettingLiftDataByLiftId(int id )throws SQLException{
        setConection();
        String sql = "SELECT `lift-num` , `lift-type`.`lift-type-details` ,`lift-floor-num`,`lift-well-num`,`companies`.`company-name`,`sites`.`site-name`,`start-work`,`num-work-day` ,`our-lifts`.`po` FROM `our-lifts` JOIN `lift-type` on `lift-type`.`id`= `our-lifts`.`lift-type-id` JOIN `sites` on `sites`.`id` = `our-lifts`.`site-id` JOIN `companies` on`companies`.`id` = `our-lifts`.`company-id` WHERE `our-lifts`.id = ? ";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        return ps.executeQuery();
    }
         // end create lifts
        
        
    // loadAllSavedCreatedLifts
    public static  ResultSet loadAllSavedLifts() throws SQLException{
           setConection();
            String sql ="SELECT `our-lifts`.`id`,`our-lifts`.`po`,`lift-num`,`lift-type`.`lift-type-details`,`lift-floor-num`,`lift-well-num`,`start-work`,`num-work-day`,`sites`.`site-name`, `companies`.`company-name`, count(`technician-of-lift`.`lift-id` ) ,`our-lifts`.`lift-type-id` FROM `our-lifts`LEFT join `technician-of-lift` ON `our-lifts`.`id` = `technician-of-lift`.`lift-id` LEFT join `lift-type`ON `lift-type`.`id` = `our-lifts`.`lift-type-id` LEFT join `sites` on `sites`.`id` = `our-lifts`.`site-id` LEFT join `companies` on `companies`.`id` = `our-lifts`.`company-id` GROUP by `our-lifts`.`id` ";
            PreparedStatement ps = connection.prepareStatement(sql);
            return  ps.executeQuery();
    }
  
    
       public static ResultSet gettingAllStagesOfSpecialLiftType(int liftTypeId)throws SQLException{
        setConection();
        String sql = "SELECT `lift-type-progress`.`id` , `lift-type-progress`.`progress-details` , `lift-type-progress`.`progress-ratio` from `lift-type-progress` where `lift-type-progress`.`lift-type-id` =  ? order by  `lift-type-progress`.`progress-ratio` ";
        PreparedStatement ps = connection.prepareStatement(sql);
        System.out.println(sql);
        ps.setInt(1, liftTypeId);
        return ps.executeQuery();
    }
       //start following
       public static int insertNewFollowing(Following f)throws SQLException, IOException{
       
           setConection();
           String sql = "INSERT INTO `following-lift`(`id`, `lift-id`, `following-details`, `following-date`, `img-path`, `img`, `progress-id`, `userId`) "
                   + "VALUES (?,?,?,?,?,?,?,?)";
           PreparedStatement ps = connection.prepareStatement(sql);
           ps.setInt(1, f.getId());
           ps.setInt(2, f.getLiftId());
           ps.setString(3, f.getFollowingDetails());
           ps.setDate(4, f.getFollowingDate());
           ps.setString(5, f.getImgPath());
           ps.setBlob(6, f.getFile());
           ps.setInt(7, f.getProgressId());
           ps.setInt(8, f.getUserId());
           
       return ps.executeUpdate();
       }
      public static ResultSet loadAllLastFollowingOfLift(int liftID) throws SQLException{
      setConection();
      String sql = "SELECT `following-lift`.`id` , `following-details`, `lift-type-progress`.`progress-details`, `lift-type-progress`.`progress-ratio` , `following-date` , `users`.`userName` , `img-path`"
              + " from `following-lift`"
                      + "left JOIN `lift-type-progress` on `following-lift`.`progress-id` = `lift-type-progress`.`id` left JOIN `users` On `users`.id =  `following-lift`.`userId` WHERE `lift-id`= ? ";
      PreparedStatement ps = connection.prepareStatement(sql);
      ps.setInt(1, liftID);
      return  ps.executeQuery();
    }
  public static int deleteFollowingRecord (int id )throws SQLException{
        setConection();
        String sql = "delete from `following-lift` where id = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        return  ps.executeUpdate();
    }
    public static ResultSet downloadImgFromFollowing(int followingId) throws SQLException{
        setConection();
        String sql = "SELECT `img` FROM `following-lift` WHERE `id` = "+followingId;
        PreparedStatement ps = connection.prepareStatement(sql);
        return  ps.executeQuery(sql);
    }
    public static ResultSet gettFollwingReportByDate(Date followingDate) throws SQLException{
        setConection();
        String sql = "SELECT `following-lift`.`id`,`following-lift`.`lift-id`,`our-lifts`.`lift-num`,`following-details`,`sites`.`site-name` , `users`.`userName` FROM `following-lift` JOIN `our-lifts` on `following-lift`.`lift-id` = `our-lifts`.`id` JOIN `sites` on `our-lifts`.`site-id` = `sites`.`id` JOIN `users` on `following-lift`.`userId` = `users`.`id` WHERE `following-lift`.`following-date` = '"+followingDate+"'";
        System.out.println(sql);
        PreparedStatement ps = connection.prepareStatement(sql);
        return ps.executeQuery();
    }
       //end following
}
