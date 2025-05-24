package org.example.app.tonnavette.web.commuter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.app.tonnavette.DatabaseConnection;
import org.example.app.tonnavette.dao.EntrepriseDAO;
import org.example.app.tonnavette.dao.SubscriptionDAO;
import org.example.app.tonnavette.dao.UtilisateurDAO;
import org.example.app.tonnavette.model.Entreprise;
import org.example.app.tonnavette.model.Navette;
import org.example.app.tonnavette.model.Subscription;
import org.example.app.tonnavette.model.Utilisateur;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/commuter-dashboard")
public class DashboardServlet extends HttpServlet {
    // In PartnerDashboardServlet.java
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Utilisateur userAuth = ((Utilisateur) request.getSession().getAttribute("userAuth"));
        if (
                userAuth == null
        ) {
            response.sendRedirect("./views/commuter-account-login.jsp?action=sign-in");
        }
        try {
            Connection connection = DatabaseConnection.getConnection();

            SubscriptionDAO dao = new SubscriptionDAO(connection);
            List<Subscription> Subs = dao.getSubscriptionsByUserId(userAuth.getId());

//            request.setAttribute("activePage", "dashboard"); // or "shuttles", "routes", etc.
            request.setAttribute("subscription", Subs);
//////        request.setAttribute("revenue", dao.getRevenueStats(partner, "monthly"));
//////        request.setAttribute("utilization", dao.getShuttleUtilization(partner));
            request.getRequestDispatcher("./views/commuter-dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
