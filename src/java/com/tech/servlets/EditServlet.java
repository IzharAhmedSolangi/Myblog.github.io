
package com.tech.servlets;

import com.tech.dao.userDao;
import com.tech.entities.Message;
import com.tech.entities.User;
import com.tech.helper.ConnectionProvider;
import com.tech.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Dell
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            String name = request.getParameter("user_name");
            String mail = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String about = request.getParameter("about");
            Part part = request.getPart("image");
            String filename = part.getSubmittedFileName();

            HttpSession s = request.getSession();

            User u = (User) s.getAttribute("CurrentUser");
            u.setName(name);
            u.setEmail(mail);
            u.setPassword(password);
            u.setAbout(about);
//            String OldFilePath = u.getProfile();
            u.setProfile(filename);

            userDao dao = new userDao(ConnectionProvider.getConnection());
            dao.updateUser(u);
            String path = request.getRealPath("/") + "profile_pics" + File.separator + u.getProfile();
            
//            String OldFile = request.getRealPath("/") + "profile_pics" + File.separator + OldFilePath;
            
//            Helper.deleteFile(path);

            if (Helper.saveFile(part.getInputStream(), path)) {
                out.print("Updated Successfuly...");
                System.out.println(path);
                Message msg = new Message("Profile Updated Successfully..", "success", "alert-success");
                s.setAttribute("msg", msg);

            } else {
                out.print("Something Went Wrong Try Again....!");
                Message msg = new Message("Something Went Wrong Try Again....!", "error", "alert-danger");
                s.setAttribute("msg", msg);
            }
            response.sendRedirect("profile.jsp");

            out.println("</body>");
            out.println("</html>");
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
