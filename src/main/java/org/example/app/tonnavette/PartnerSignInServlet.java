package org.example.app.tonnavette;


import jakarta.servlet.http.HttpSession;
import org.example.app.tonnavette.dao.EntrepriseDAO;
import org.example.app.tonnavette.model.Entreprise;
import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.sql.Connection;

@WebServlet("/partner-login")
public class PartnerSignInServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("business-email");
        String password = request.getParameter("password");

        try {
            Connection connection = DatabaseConnection.getConnection();
            EntrepriseDAO dao = new EntrepriseDAO(connection);
            Entreprise entreprise = dao.authentifier(email, password);

            if (entreprise != null && entreprise.getHashedPassword().equals(password)) {
                // Login successful – create session
                HttpSession session = request.getSession();
                session.setAttribute("entreprise", entreprise);
                response.sendRedirect("/views/partner-dashboard.jsp");
            } else {
                // Login failed – set error and forward back
                request.setAttribute("error", "Invalid email or password.");
                request.getRequestDispatcher("./views/business-account-login.jsp?action=sign-in&error=True").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Login error.");
        }
    }
}
