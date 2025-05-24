package org.example.app.tonnavette.web.partner;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.app.tonnavette.DatabaseConnection;
import org.example.app.tonnavette.dao.EntrepriseDAO;
import org.example.app.tonnavette.model.Entreprise;
import org.example.app.tonnavette.model.Navette;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/partner-dashboard")
public class PartnerDashboard extends HttpServlet {
    // In PartnerDashboardServlet.java
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Entreprise partner = ((Entreprise) request.getSession().getAttribute("loggedPartner"));
        if (
                partner == null
        ) {
            response.sendRedirect("./views/business-account-login.jsp?action=sign-in&error=True");
        }
        try {
            Connection connection = DatabaseConnection.getConnection();
            System.out.println(partner.getId());
            EntrepriseDAO dao = new EntrepriseDAO(connection);
            List<Navette> navettes = dao.getNavettesByPartner(partner.getId());


            request.setAttribute("activePage", "dashboard"); // or "shuttles", "routes", etc.
            request.setAttribute("shuttles", navettes);
////        request.setAttribute("revenue", dao.getRevenueStats(partner, "monthly"));
////        request.setAttribute("utilization", dao.getShuttleUtilization(partner));
            request.getRequestDispatcher("./views/partner-dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
