package org.example.app.tonnavette;


import org.example.app.tonnavette.dao.SubscriptionDAO;
import org.example.app.tonnavette.model.Subscription;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


import java.sql.Connection;
import java.io.IOException;
import java.util.List;
import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDateTime;

@WebServlet("/processSubscription")
public class SubscriptionSaveServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int navetteId = Integer.parseInt(request.getParameter("navetteId"));

        try (Connection connection = DatabaseConnection.getConnection()) {
            SubscriptionDAO dao = new SubscriptionDAO(connection);
            Subscription subscription = new Subscription();
            subscription.setUserId(userId);
            subscription.setNavetteId(navetteId);
            subscription.setSubscribedAt(LocalDateTime.now());

            dao.addSubscription(subscription);

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("Subscription saved successfully.");

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Failed to save subscription.");
        }
    }
}
