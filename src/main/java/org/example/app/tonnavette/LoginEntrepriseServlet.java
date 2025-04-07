package org.example.app.tonnavette;


import jakarta.servlet.http.HttpSession;
import org.example.app.tonnavette.dao.EntrepriseDAO;
import org.example.app.tonnavette.model.Entreprise;

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

@WebServlet("/entreprise-login")
public class LoginEntrepriseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection connection = DatabaseConnection.getConnection()) {
            EntrepriseDAO dao = new EntrepriseDAO(connection);
            Entreprise entreprise = dao.authentifier(email, password);

            if (entreprise != null && entreprise.getHashedPassword().equals(password)) {
                // Login successful – create session
                HttpSession session = request.getSession();
                session.setAttribute("entreprise", entreprise);
                response.sendRedirect("entreprise-dashboard.jsp");
            } else {
                // Login failed – set error and forward back
                request.setAttribute("error", "Invalid email or password.");
                request.getRequestDispatcher("/entreprise-login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Login error.");
        }
    }
}
