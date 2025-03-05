package org.example.app.tonnavette;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

@WebServlet(name = "inscription", value = "/sign-up")
public class InscriptionServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        res.setContentType("text/html");
        res.getWriter().write("Servlet reached successfully!"); // Debugging
    }
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        res.setContentType("text/html");

        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");

        // Get form parameters
        String nom = req.getParameter("nom");
        String email = req.getParameter("email");
        String motDePasse = req.getParameter("motDePasse");
        String role = req.getParameter("role");

        // Create JSON response
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("nom", nom);
        jsonResponse.put("email", email);
        jsonResponse.put("motDePasse", motDePasse);
        jsonResponse.put("role", role);

        // Send JSON response
        res.getWriter().write(jsonResponse.toString());

    }
}
