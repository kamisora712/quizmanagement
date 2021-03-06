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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import minhnln.DAO.AnswerDAO;
import minhnln.DAO.QuestionDAO;
import minhnln.DAO.SubjectDAO;
import minhnln.DTO.AnswerDTO;
import minhnln.DTO.QuestionDTO;
import minhnln.DTO.SubjectDTO;

/**
 *
 * @author Welcome
 */
@WebServlet(name = "SearchQuestionServlet", urlPatterns = {"/SearchQuestionServlet"})
public class SearchQuestionServlet extends HttpServlet {

    private final String ERROR_PAGE = "error.jsp";
    private final String SEARCH_PAGE = "search.jsp";

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
        String questionname = request.getParameter("txtQuestionName");
        boolean status = Boolean.parseBoolean(request.getParameter("cboStatus"));
        String subject = request.getParameter("cboSubject");
        String url = ERROR_PAGE;
        try {
            QuestionDAO Qdao = new QuestionDAO();
            AnswerDAO Adao = new AnswerDAO();
            SubjectDAO Sdao = new SubjectDAO();
            if (questionname.contains("%")) {
                String lastURL = request.getHeader("referer");
                request.setAttribute("ERROR", "Error Occured When Searching");
                request.setAttribute("LASTURL", lastURL);
                return;
            }
            if (questionname.isEmpty()) {
                questionname = "%";
            }
            if (subject.isEmpty()) {
                subject = "%";
            }
            final int pagingSize = 5; //t???ng s???n ph???m c???a 1 trang
            int SumofProduct;// t???ng s??? l?????ng s???n ph???m
            int NumofPage;//S??? trang s??? ???????c t???o
            int pageNo = 1;//M???c ?????nh s??? l?? trang ?????u ti??n (pageNo=1)
            //V??? s??? l?????ng trang~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            if (request.getParameter("pageNo") != null) {
                pageNo = Integer.parseInt(request.getParameter("pageNo"));
            }
            SumofProduct = Qdao.getTotalOfQuestionAfterSearch(questionname, status, subject);
            NumofPage = SumofProduct / pagingSize;
            if (SumofProduct > pagingSize * NumofPage) {//N???u t???ng s???n ph???m l???n h??n t???ng s??? l?????ng s???n ph???m trong c??c trang
                NumofPage += 1;
            }
            //V??? hi???n th???~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            List<QuestionDTO> Qlist = Qdao.searchQuestionwithPaging(questionname, status, subject, pageNo, pagingSize);
            Map<String, List<AnswerDTO>> map = new HashMap<>();
            for (int i = 0; i < Qlist.size(); i++) {
                String QuestionID = Qlist.get(i).getQuestionID();
                List<AnswerDTO> Alist = Adao.displayAnswerPerQuestion(QuestionID);
                map.put(QuestionID, Alist);
            }
            List<SubjectDTO> Slist = Sdao.getSubject();
            HttpSession session = request.getSession();
            session.setAttribute("SLIST", Slist);
            session.setAttribute("QLIST", Qlist);
            session.setAttribute("MAP", map);
            request.setAttribute("MAXPAGENO", NumofPage);
            url = SEARCH_PAGE;
        } catch (Exception e) {
            log("Error at SearchQuestionServlet: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
