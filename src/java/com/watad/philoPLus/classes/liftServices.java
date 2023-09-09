/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.watad.philoPLus.classes;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import javax.ws.rs.container.DynamicFeature;
import javax.ws.rs.container.ResourceInfo;
import javax.ws.rs.core.FeatureContext;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.Response;
import org.glassfish.jersey.server.ResourceConfig;
import java.io.IOException;
import javax.ws.rs.PathParam;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import javax.ws.rs.core.MultivaluedMap;
import com.watad.philoPLus.classes.Lift;
import com.watad.philoPLus.classes.liftProgress;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.Produces;



@Path("/lift")
public class liftServices extends ResourceConfig{

    public liftServices() {
    }
  
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/gettingLiftData")
    public  List<Lift> gettingLiftData(){
        try{
            ResultSet rs = DataBase.loadAllSavedLifts();
            List<Lift> lifts = new ArrayList<>();
            while (rs.next()) {                
                 int id = rs.getInt(1);
                String po = rs.getString(2);
                String liftNum = rs.getString(3);
                String lift_type_details = rs.getString(4);
                int lift_floor_number = rs.getInt(5);
                int lift_well_num  = rs.getInt(6);
                Date startWork = rs.getDate(7);
                int num_work_day = rs.getInt(8);         
                String siteName = rs.getString(9);
                String CampanyName = rs.getString(10);
                int techniciansNumber = rs.getInt(11);
                int liftTypeID = rs.getInt(12);
                Lift one = new Lift(id, liftNum, po, lift_type_details, lift_floor_number, lift_well_num, techniciansNumber, startWork, num_work_day, siteName, CampanyName, liftTypeID);
                lifts.add(one);
            }
            return lifts;
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            return null;
        }
        
    }
    
  
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/gettingLiftProgress/{liftTypeId}")
    public List<liftProgress> gettingLiftProgress(@PathParam("liftTypeId")int liftTypeId) {
        try {
            ResultSet rs = DataBase.gettingAllStagesOfSpecialLiftType(liftTypeId);
             List<liftProgress> followingPorgrssList = new ArrayList<>();
             System.out.println("we create follo");
            while (rs.next()) {
                System.out.println("we here in rs ");
                int id = rs.getInt(1);
                String progressDetails = rs.getString(2);
                float ratio = rs.getFloat(3);
                liftProgress f = new liftProgress(id, liftTypeId, progressDetails, ratio);
                System.out.println("id "+f.getId()+"   details"+f.getLiftProgressDetails()+"  ratio"+f.getRatio()+" typeid "+f.getLiftTypeId());
                followingPorgrssList.add(f);
            }
            return followingPorgrssList;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }
}
