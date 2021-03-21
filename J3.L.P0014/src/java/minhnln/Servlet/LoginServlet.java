/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnln.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import minhnln.DAO.RegistrationDAO;

/**
 *
 * @author Welcome
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private final String ERROR_PAGE = "error.jsp";
    private final String MAIN_PAGE = "main.jsp";
    private final String LOGIN_PAGE = "login.jsp";

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
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        String url = ERROR_PAGE;
        boolean geterror = false;
        try {
            RegistrationDAO dao = new RegistrationDAO();
            HttpSession session = request.getSession();
            if(session!=null){
                
            }
            //Check Valid
            if (email.isEmpty()) {
                request.setAttribute("EMAILERROR", "Email is empty!");
                url = LOGIN_PAGE;
                geterror = true;
            }
            if (!email.matches("\\w+[@]\\w+[.][a-zA-Z]{2,4}[.]?[a-zA-Z]{0,4}$")) {
                request.setAttribute("EMAILERROR", "Wrong input Email!!");
                url = LOGIN_PAGE;
                geterror = true;
            }
            if (password.isEmpty()) {
                request.setAttribute("PASSWORDERROR", "Password is empty!");
                url = LOGIN_PAGE;
                geterror = true;
            }
            //Xử lý Password
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] encodedhash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            String passInDatabse = dao.bytesToHex(encodedhash);
            if (!geterror) {
                boolean login = dao.login(email, passInDatabse);
                if (login) {
                    session.setAttribute("NAME", dao.getNamebyEmail(email));
                    session.setAttribute("ROLE", dao.getRolebyEmail(email));
                    session.setAttribute("EMAIL", email);
                    url = MAIN_PAGE;
                } else {
                    String lastURL = request.getHeader("referer");
                    request.setAttribute("ERROR", "Email or Password are NOT existed! Please try again!");
                    request.setAttribute("LASTURL", lastURL);
                    geterror = true;
                }
            }
        } catch (Exception e) {
            log("Error At LoginServlet" + e.getMessage());
        } finally {
            if (geterror) {
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                response.sendRedirect(url);
            }
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
