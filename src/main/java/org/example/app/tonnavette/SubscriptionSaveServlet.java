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
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            int navetteId = Integer.parseInt(request.getParameter("navetteId"));
            String pickupPoint = request.getParameter("pickupPoint");

            System.out.println("User ID: " + userId);
            System.out.println("Navette ID: " + navetteId);
            System.out.println("Pickup Point: " + pickupPoint);

//            try () {
            Connection connection = DatabaseConnection.getConnection();
            SubscriptionDAO dao = new SubscriptionDAO(connection);
            Subscription subscription = new Subscription();
            subscription.setUserId(userId);
            subscription.setNavetteId(navetteId);
            subscription.setSubscribedAt(LocalDateTime.now());
            subscription.setPickupPoint(pickupPoint);

            dao.addSubscription(subscription);

            // Set toast message to be used in JSP
            request.setAttribute("toastMessage", "🚀 Subscription successful!");
            request.setAttribute("toastType", "success");

            request.getRequestDispatcher("./views/commuter-dashboard.jsp").forward(request, response);
//            }
//        } catch (NumberFormatException e) {
//            e.printStackTrace();
//            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//            response.getWriter().write("Invalid input data.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("toastMessage", "❌ Failed to subscribe. Please try again later.");
            request.setAttribute("toastType", "error");
            request.getRequestDispatcher("../webapp/views/subscriptionPage.jsp").forward(request, response);
        }
    }

}
