package org.example.app.tonnavette;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.app.tonnavette.dao.NavetteDAO;
import org.example.app.tonnavette.model.Navette;

import java.sql.Connection;

@WebServlet("/nav")
public class GetNavetteDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

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

            System.out.println("💛💛💛💛💛Navette: " +
                    ", Depart: " + nav.getVilleDepart() +
                    ", Arrivee: " + nav.getVilleArrivee() +
                    ", Heure Depart: " + nav.getHeureDepart() +
                    ", Heure Arrivee: " + nav.getHeureArrivee());

            if (nav == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("{\"error\": \"Navette not found\"}");
                return;
            }

            // Convert to JSON
            Gson gson = new Gson();
            String json = gson.toJson(nav);

            response.setContentType("application/json");
            response.getWriter().write(json);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Invalid ID format\"}");
        }
    }
}
