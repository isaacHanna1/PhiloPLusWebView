
package com.watad.philoPLus.classes;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Seha
 */
public class User {
    private int id ;
    private String userName ;
    private  String passsword;

    public User() {
    }

    public int getId() {
        return id;
    }

    public User(int id, String userName, String passsword) {
        this.id = id;
        this.userName = userName;
        this.passsword = passsword;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPasssword() {
        return passsword;
    }

    public void setPasssword(String passsword) {
        this.passsword = passsword;
    }
    
    public boolean chechLoginAvability() throws SQLException{
        
        ResultSet rs =  DataBase.checkValidalityLogin(userName, passsword);
        if(rs.next()){
        return true;
        }
        else{
        return false;
        }
    }
    
    public  int  getUserIdFromDataBase(){
        return  DataBase.getUserId(userName);
    }
}
