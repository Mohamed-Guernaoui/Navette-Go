package org.example.app.tonnavette.web.partner;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.app.tonnavette.model.Entreprise;

import java.io.IOException;

@WebServlet("/dashboard/shuttles/new")
public class NewShuttleServlet extends HttpServlet {
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
            request.setAttribute("activePage", "newShuttle"); // or "shuttles", "routes", etc.
            request.getRequestDispatcher("/views/add-shuttle.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

}