package org.example.app.tonnavette;

import java.io.*;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.app.tonnavette.dao.NavetteDAO;
import org.example.app.tonnavette.model.Navette;

import java.sql.Connection;

@WebServlet("/navettes")
public class NavetteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = DatabaseConnection.getConnection();
        NavetteDAO navetteDAO = new NavetteDAO(connection);
        List<Navette> navettes = navetteDAO.getAllNavettes();

        request.setAttribute("navettes", navettes);
        request.getRequestDispatcher("/views/navettes.jsp").forward(request, response);
    }
}