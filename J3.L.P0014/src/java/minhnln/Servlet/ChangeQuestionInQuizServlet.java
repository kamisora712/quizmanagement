/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnln.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import minhnln.DAO.AnswerDAO;
import minhnln.DAO.QuestionDAO;
import minhnln.DAO.RandomQuizDAO;
import minhnln.DTO.AnswerDTO;
import minhnln.DTO.QuestionDTO;
import minhnln.DTO.RandomQuizDTO;

/**
 *
 * @author Welcome
 */
@WebServlet(name = "ChangeQuestionInQuizServlet", urlPatterns = {"/ChangeQuestionInQuizServlet"})
public class ChangeQuestionInQuizServlet extends HttpServlet {

    private final String DO_QUIZ_PAGE = "doquiz.jsp";
    private final String ERROR_PAGE = "error.jsp";

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
        String url = ERROR_PAGE;
        try {
            AnswerDAO Adao = new AnswerDAO();
            RandomQuizDAO RQdao = new RandomQuizDAO();
            HttpSession session = request.getSession();
            //Vể việc chuyển đổi RandomID
            List<RandomQuizDTO> RQList = (List<RandomQuizDTO>) session.getAttribute("RQLIST");
            int RandomID = Integer.parseInt(request.getParameter("txtQuestionPos"));
            if (RandomID == 0) {
                RandomID = RQList.size();
            } else if (RandomID > RQList.size()) {
                RandomID = 1;
            }
            if (request.getParameter("txtQuestionPosNow") != null) {
                int QuestionPos = Integer.parseInt(request.getParameter("txtQuestionPosNow"));
                String choseAnswerID = request.getParameter("rbtQuestion" + QuestionPos);
                RQdao.setChoseAnswerID(choseAnswerID, QuestionPos, RQList);
            }
            //Về Hiển thị
            List<QuestionDTO> Qlist = RQdao.displayQuestionInRandomList(RandomID, RQList);
            Map<String, List<AnswerDTO>> questionmap = new HashMap<>();
            for (int i = 0; i < Qlist.size(); i++) {
                String QuestionID = Qlist.get(i).getQuestionID();
                List<AnswerDTO> Alist = Adao.displayAnswerPerQuestion(QuestionID);
                questionmap.put(QuestionID, Alist);
            }
            url = DO_QUIZ_PAGE;
            session.setAttribute("QLIST", Qlist);
            session.setAttribute("MAP", questionmap);
            session.setAttribute("QUIZPOS", RandomID);
        } catch (Exception e) {
            log("ERROR AT ChangeQuestionInQuizServlet: " + e.getMessage());
        } finally {
            response.sendRedirect(url);
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
