package org.example.app.tonnavette;

import org.example.app.tonnavette.dao.EntrepriseDAO;
import org.example.app.tonnavette.model.Entreprise;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


import java.sql.Connection;
import java.io.IOException;


@WebServlet("/create-entreprise-account")
public class CreateEntrepriseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Basic validation (you can expand this)
        if (nom == null || email == null || password == null ||
                nom.isEmpty() || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("/register-entreprise.jsp").forward(request, response);
            return;
        }

        try (Connection connection = DatabaseConnection.getConnection()) {
            Entreprise entreprise = new Entreprise();
            entreprise.setNom(nom);
            entreprise.setEmail(email);
            entreprise.setHashedPassword(password); // You should hash this password

            EntrepriseDAO dao = new EntrepriseDAO(connection);
            boolean success = dao.createEntreprise(entreprise);

            if (success) {
                response.sendRedirect("entreprise-dashboard.jsp");
            } else {
                request.setAttribute("error", "Failed to register entreprise.");
                request.getRequestDispatcher("/register-entreprise.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong.");
        }
    }
}
