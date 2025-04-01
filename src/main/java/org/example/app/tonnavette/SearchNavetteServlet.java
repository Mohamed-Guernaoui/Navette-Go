package org.example.app.tonnavette;

import org.example.app.tonnavette.dao.NavetteDAO;
import org.example.app.tonnavette.model.Navette;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


import java.sql.Connection;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/search-navette", name = "search-navette")
public class SearchNavetteServlet extends HttpServlet {
    private NavetteDAO navetteDAO;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("q");
        Connection connection = DatabaseConnection.getConnection();
        NavetteDAO navetteDAO = new NavetteDAO(connection);

        List<Navette> navettes = navetteDAO.searchNavettes(query);

        request.setAttribute("navettes", navettes);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
