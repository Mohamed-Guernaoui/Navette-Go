package org.example.app.tonnavette;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.app.tonnavette.dao.NavetteDAO;
import org.example.app.tonnavette.model.Navette;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/subscription")
public class subscription extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get trip details from the form submission
        String idParam = request.getParameter("navetteId");

        if (idParam == null || idParam.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Missing navette ID\"}");
            return;
        }

        try {
            int navetteId = Integer.parseInt(idParam);
            System.out.println(navetteId);
            Connection connection = DatabaseConnection.getConnection();

            NavetteDAO navetteDAO = new NavetteDAO(connection);

            Navette nav = navetteDAO.getNavetteById(navetteId);

            System.out.println("💛💛💛💛💛 Sub Navette: " +
                    ", Depart: " + nav.getVilleDepart() +
                    ", Arrivee: " + nav.getVilleArrivee() +
                    ", Heure Depart: " + nav.getHeureDepart() +
                    ", Heure Arrivee: " + nav.getHeureArrivee());

            if (nav == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("{\"error\": \"Navette not found\"}");
                return;
            }
            request.setAttribute("selectedNavette", nav);
            // Forward to the checkout JSP
            request.getRequestDispatcher("/views/subscriptionPage.jsp").forward(request, response);


        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Invalid ID format\"}");
        }
    }
}