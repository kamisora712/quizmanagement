/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnln.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import minhnln.DAO.HistoryDAO;
import minhnln.DAO.SubjectDAO;
import minhnln.DTO.HistoryDTO;
import minhnln.DTO.SubjectDTO;

/**
 *
 * @author Welcome
 */
@WebServlet(name = "DisplayHistoryServlet", urlPatterns = {"/DisplayHistoryServlet"})
public class DisplayHistoryServlet extends HttpServlet {

    private final String ERROR_PAGE = "error.jsp";
    private final String HISTORY_PAGE = "history.jsp";

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
        final int pagingSize = 20; //tổng dòng của 1 trang
        int SumofRow;// tổng số lượng dòng
        int NumofPage;//Số trang sẽ được tạo
        int pageNo = 1;//Mặc định sẽ là trang đầu tiên (pageNo=1)
        try {
            HistoryDAO Hdao = new HistoryDAO();
            SubjectDAO Sdao = new SubjectDAO();
            //Xử lý về số trang
            if (request.getParameter("pageNo") != null) {
                pageNo = Integer.parseInt(request.getParameter("pageNo"));
            }
            SumofRow = Hdao.getTotalOfHistory();
            NumofPage = SumofRow / pagingSize;
            if (SumofRow > pagingSize * NumofPage) {//Nếu tổng sản phẩm lớn hơn tổng số lượng sản phẩm trong các trang
                NumofPage += 1;
            }
            List<HistoryDTO> Hlist = Hdao.displayAllHistoryWithPaging(pageNo, pagingSize);
            List<SubjectDTO> Slist = Sdao.getSubject();
            HttpSession session = request.getSession();
            url = HISTORY_PAGE;
            session.removeAttribute("SLIST");
            session.removeAttribute("QLIST");
            session.removeAttribute("MAP");
            session.setAttribute("SLIST", Slist);
            session.setAttribute("HLIST", Hlist);
            request.setAttribute("MAXPAGENO", NumofPage);
        } catch (Exception e) {
            log("Error at ViewHistoryServlet: " + e.getMessage());
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
