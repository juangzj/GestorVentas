/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlerts;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mundo.GestionUsuario;

/**
 *
 * @author Usuario 1
 */
@WebServlet(name = "SvEliminarUsuario", urlPatterns = {"/SvEliminarUsuario"})
public class SvEliminarUsuario extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    GestionUsuario gestiona = new GestionUsuario();
    int id = 0;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idUsuario = request.getParameter("idUsuarioEliminar");
        String confirmacion = request.getParameter("confirmacionEliminacion");
        
        if(idUsuario != null){
            id = Integer.parseInt(idUsuario);
        }
        if(confirmacion != null){
            gestiona.eliminarUsuario(id);
        }
        response.sendRedirect("usuarios.jsp");
    }
  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
