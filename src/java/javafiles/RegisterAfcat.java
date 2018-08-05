/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javafiles;

import db.Connect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anshu
 */
public class RegisterAfcat extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(true);
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterAfcat</title>");            
            out.println("</head>");
            out.println("<body>");
                String firstName=request.getParameter("fname");
                String lastName=request.getParameter("lname");
                String gender=request.getParameter("gender");
                String dob=request.getParameter("dob");
                String fatherName=request.getParameter("faname");
                String motherName=request.getParameter("mname");
                String email=request.getParameter("email");
                String sslc=request.getParameter("sslc");
                String puc=request.getParameter("puc");
                //String phone=request.getParameter("phone");
                String qal=request.getParameter("qal");
                String cllg=request.getParameter("clname");                
                String []entry=request.getParameterValues("entry");
                int s=Integer.valueOf(sslc);
                int p=Integer.valueOf(puc);
                String fullName=firstName+" "+lastName;
                String z="";
                for (String item: entry)
                {
                    z=z+item+", ";
                }
                
                
                Connection con=Connect.getConnect();
                
                String str2="select * from afcatregister where email=?";
            
                PreparedStatement ps2=con.prepareStatement(str2);
                ps2.setString(1, email);
                

                ResultSet rs=ps2.executeQuery();

                int rowCount=0;

                while(rs.next())
                {
                    rowCount=rs.getRow();
                    
                }


                if(rowCount==0)
                {
                    String str="insert into afcatregister(userName, gender, dob, faname, mname, email, sslc, puc, qal, clname, entry) values (?,?,?,?,?,?,?,?,?,?,?)";

                    PreparedStatement ps=con.prepareStatement(str);
                    ps.setString(1, fullName);
                    ps.setString(2, gender);
                    ps.setString(3, dob);
                    ps.setString(4, fatherName);
                    ps.setString(5, motherName);
                    ps.setString(6, email);
                    ps.setInt(7, s);
                    ps.setInt(8, p);
                    ps.setString(9, qal);
                    ps.setString(10, cllg);
                    ps.setString(11, z);

                    int i=ps.executeUpdate();

                    if(i>0)
                    {
                        String str3="select uid from loginbit;";
                        PreparedStatement ps1=con.prepareStatement(str3);
                        ps1=con.prepareStatement(str3);
                        rs=ps1.executeQuery();
                        rs.next();
                        int id=rs.getInt("uid");
                        
                        
                        
                        str3="update loginbit set completed=1";
                        PreparedStatement ps4=con.prepareStatement(str);
                        ps4=con.prepareStatement(str3);
                        ps4.executeUpdate(str3);
                        
                        
                        str3="update login set completed=1 where id=?";
                        PreparedStatement ps5=con.prepareStatement(str);
                        ps5=con.prepareStatement(str3);
                        ps5.setInt(1, id);
                        ps5.executeUpdate();
                        
                        response.sendRedirect("index.jsp");
                    }

                }
                else
                {
                      session.setAttribute("Message4","Email already Taken!...");   
                      response.sendRedirect("Registration.jsp");
                }

            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
            Logger.getLogger(RegisterAfcat.class.getName()).log(Level.SEVERE, null, ex);
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
