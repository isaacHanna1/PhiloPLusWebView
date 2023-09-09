/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.watad.philoPLus.classes;

import com.watad.philoPLus.classes.DataBase;
import com.watad.philoPLus.classes.Following;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

 @WebServlet("/addNewFollowingServlet")
 @MultipartConfig (maxFileSize = 52428800)
public class AddNewFollowingServlet extends HttpServlet {

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
        try {
            processRequest(request, response);
            request.setCharacterEncoding("UTF-8");
            String followingDetails = request.getParameter("followingDetails");
            System.out.println("following details  " +followingDetails);
            int progressId = Integer.parseInt(request.getParameter("progressId"));
            System.out.println("progressId "+ progressId);
            int liftId = Integer.parseInt(request.getParameter("liftId"));
            System.out.println("liftId "+ liftId);
            // obtains the upload file part in this multipart request
            Part filePart = request.getPart("imgPath");
            InputStream inputStream  = null ;
            if (filePart != null) { 
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            }
            int id = DataBase.autoNumber("`following-lift`", "id");
            Date today = Date.valueOf(LocalDate.now());
            HttpSession session = request.getSession();
            int userID = (int) session.getAttribute("loginUserId");
            Following f= new Following(id, liftId, followingDetails, today, "path", inputStream, progressId,userID);
            Following.insertNewFollowing(f);
            RequestDispatcher rd = request.getRequestDispatcher("followingLiftNumber.jsp");
            rd.forward(request, response);            
        } catch (SQLException ex) {
            Logger.getLogger(AddNewFollowingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
