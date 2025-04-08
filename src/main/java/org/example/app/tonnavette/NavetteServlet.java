package org.example.app.tonnavette;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.app.tonnavette.dao.NavetteDAO;
import org.example.app.tonnavette.model.Navette;

import java.sql.Connection;

@WebServlet("/find-navettes")
public class NavetteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = DatabaseConnection.getConnection();
        NavetteDAO navetteDAO = new NavetteDAO(connection);
        List<Navette> navettes = null;
        try {
            navettes = navetteDAO.getAllNavettes();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("navettes", navettes);
        request.getRequestDispatcher("list-navettes.jsp").forward(request, response);
    }
}