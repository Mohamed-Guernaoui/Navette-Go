package org.example.app.tonnavette;

import org.example.app.tonnavette.dao.UtilisateurDAO;
import org.example.app.tonnavette.model.Utilisateur;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


import java.sql.Connection;
import java.io.IOException;


@WebServlet("/create-commuter-account")
public class UserSignUpServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nom = request.getParameter("lastName");
        String prenom = request.getParameter("firstName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String prof = request.getParameter("prof");


        try {
            Connection connection = DatabaseConnection.getConnection();
            UtilisateurDAO dao = new UtilisateurDAO(connection);
            if (dao.emailExists(email)) {
                response.sendRedirect("./views/commuter-account-login.jsp?action=sign-up&error=email_exists");
                return;
            }


            Utilisateur user = new Utilisateur();
            user.setNom(nom);
            user.setEmail(email);
            user.setMotDePasse(password); // You should hash this password
            user.setProf(prof);
            user.setPrenom(prenom);

            boolean success = dao.ajouterUtilisateur(user);

            if (success) {
                response.sendRedirect("./views/commuter-account-login.jsp?action=sign-in");
            } else {
                request.setAttribute("error", "Failed to register new cummeter.");
                response.sendRedirect("./views/commuter-account-login.jsp?action=sign-up&error=registration_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong.");
        }
    }
}
