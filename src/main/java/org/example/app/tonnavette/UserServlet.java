package org.example.app.tonnavette;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.app.tonnavette.dao.UtilisateurDAO;
import org.example.app.tonnavette.model.Utilisateur;

import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "signIn", value = "/sign-in")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con = DatabaseConnection.getConnection();
        UtilisateurDAO userDAO = new UtilisateurDAO(con);
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Utilisateur user = userDAO.authentifier(email, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userAuth", user);
            response.sendRedirect("index.jsp"); // Redirection après connexion
        } else {
            response.sendRedirect("views/login.jsp?error=Identifiants incorrects");
        }


    }
}
