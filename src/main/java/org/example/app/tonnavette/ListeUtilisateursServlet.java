package org.example.app.tonnavette;


import java.io.*;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.app.tonnavette.dao.UtilisateurDAO;
import org.example.app.tonnavette.model.Utilisateur;

import java.sql.Connection;


@WebServlet("/utilisateurs")
public class ListeUtilisateursServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Connexion à la base de données
        Connection connection = DatabaseConnection.getConnection();
        UtilisateurDAO utilisateurDAO = new UtilisateurDAO(connection);

        // 2️⃣ Récupération des utilisateurs
        List<Utilisateur> utilisateurs = utilisateurDAO.getAllUsers();

        // 3️⃣ Envoi des utilisateurs à la JSP
        request.setAttribute("utilisateurs", utilisateurs);
        request.getRequestDispatcher("/views/utilisateurs.jsp").forward(request, response);
    }
}
