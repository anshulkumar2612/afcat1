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
public class UserResetPassword extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            
            HttpSession session = request.getSession(true);
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
                    
            out.println("</head>");
            out.println("<body>");
            
            Connection con = Connect.getConnect();
            
            String str="select * from loginbit;";
            
            PreparedStatement ps=con.prepareStatement(str);
            
            
            ResultSet rs=ps.executeQuery();
            
            int x=0;
            int uid=0;
            
            while(rs.next())
            {
                
                x=rs.getRow();
                uid=rs.getInt("uid");
            }
            if(x==1)
            {
                String str1="select * from login where id=?";
                ps=con.prepareStatement(str1);
                ps.setInt(1, uid);
                rs=ps.executeQuery();
                rs.next();
                out.println("</br></br></br></br></br></br></br></br></br></br><center><strong><font color='red'>Already Logged in as "+rs.getString("uname")+"</font></strong></center>");
                response.setHeader("Refresh", "2;url=index.jsp");
            }
            else
            {
                session.setAttribute("Message3",null);
                String uname=request.getParameter("username");
                String pwd=request.getParameter("password");
                String str1= "select * from login where uname=?";
                Connection con1 = Connect.getConnect();
                PreparedStatement ps1=con1.prepareStatement(str1);
                ps1.setString(1, uname);
                
                ResultSet rs1=ps1.executeQuery();
                int rowCount=0;
                int st=0;
                
                while(rs1.next())
                {
                    rowCount=rs1.getRow();
                    st=rs1.getInt("id");
                }
                if(rowCount==0)
                {
                    session.setAttribute("Message3","Username Does Not Exist");
                    response.sendRedirect("CandidateForgetPassword.jsp");
                    
                }
                else
                {
                    str1="update login set pwd=? where uname=?";
                    ps1=con.prepareStatement(str1);
                    ps1.setString(1, pwd);
                    ps1.setString(2, uname);
                    ps1.executeUpdate();
                    session.setAttribute("Message3","Password Changed Successfully");
                    response.sendRedirect("CandidateForgetPassword.jsp");
                }
            }                
            
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
            Logger.getLogger(UserResetPassword.class.getName()).log(Level.SEVERE, null, ex);
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
