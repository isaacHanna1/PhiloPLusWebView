package com.watad.philoPLus.classes;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Seha
 */
public class GetLiftTypeCompanyName extends HttpServlet {

    List <TypeOfLifts>liftType_list  = new ArrayList();
    List <Companies> companies_list  = new ArrayList();
    List <Sites> sites_list  = new ArrayList();
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            companies_list.clear();
            liftType_list.clear();
            sites_list.clear();
            //getting lift types from database and set object to list 
        ResultSet rs =  DataBase.gettingAllLiftType() ;
            while (rs.next()) {
                int id = rs.getInt(1);
                String liftType = rs.getString(2);
                TypeOfLifts newOne = new TypeOfLifts(id, liftType);
                this.liftType_list.add(newOne);
            }
            
            ResultSet rsCompanies = DataBase.gettingAllCampaniesName();
            while (rsCompanies.next()) {
                int id = rsCompanies.getInt(1);
                String companyName = rsCompanies.getString(2);
                Companies newOne = new Companies(id, companyName);
                this.companies_list.add(newOne);
            }
              ResultSet rsSites = DataBase.gettingAllSitesName();
            while (rsSites.next()) {
                int id = rsSites.getInt(1);
                String siteName = rsSites.getString(2);
                Sites newOne = new Sites(id, siteName);
                this.sites_list.add(newOne);
            }
            
            request.setAttribute("liftsType", this.liftType_list);
            request.setAttribute("companyList", this.companies_list);
            request.setAttribute("SiteList", this.sites_list); 
            String id = request.getParameter("liftId");
            System.out.println(" id "+ id);
            if(id == null){
            RequestDispatcher rd = request.getRequestDispatcher("creadtedLift.jsp");
            rd.forward(request, response);
            }
            else{
            RequestDispatcher rd = request.getRequestDispatcher("editLift.jsp?"+id);
            rd.forward(request, response);
            }
        }catch(SQLException ex){
            RequestDispatcher rd = request.getRequestDispatcher("errorPage.jsp");
            rd.forward(request, response);
        }
        
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
