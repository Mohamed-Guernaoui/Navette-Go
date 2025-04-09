package org.example.app.tonnavette;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.app.tonnavette.dao.EntrepriseDAO;
import org.example.app.tonnavette.model.Entreprise;

import java.io.IOException;
import java.sql.Connection;


import org.example.app.tonnavette.dao.EntrepriseDAO;
import org.example.app.tonnavette.model.Entreprise;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


import java.sql.Connection;
import java.io.IOException;


@WebServlet("/create-partner-account")
public class becamePartnerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        // Basic validation (you can expand this)
//            if (nom == null || email == null || password == null ||
//                    nom.isEmpty() || email.isEmpty() || password.isEmpty()) {
//                request.setAttribute("error", "All fields are required.");
//                request.getRequestDispatcher("/register-entreprise.jsp").forward(request, response);
//                return;
//            }

        try {
            Connection connection = DatabaseConnection.getConnection();
            Entreprise entreprise = new Entreprise();


            entreprise.setNom(request.getParameter("companyName"));
            entreprise.setEmail(request.getParameter("businessEmail"));
            entreprise.setHashedPassword(request.getParameter("password")); // Make sure to hash in real app
            entreprise.setPhoneNumber(request.getParameter("contactPhone"));
            entreprise.setContactPerson(request.getParameter("contactPerson"));
            entreprise.setFleetSize(request.getParameter("fleetSize"));
            entreprise.setOperatingAreas(request.getParameter("operatingAreas"));
            entreprise.setCompanyType(request.getParameter("companyType"));

            // You should hash this password

            EntrepriseDAO dao = new EntrepriseDAO(connection);
            boolean success = dao.createEntreprise(entreprise);

            if (success) {
                response.sendRedirect("/views/business-account-login.jsp?action=sign-in");
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
