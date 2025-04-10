package org.example.app.tonnavette.dao;

import org.example.app.tonnavette.model.Utilisateur;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class UtilisateurDAO {
    private final Connection connection;
    private static final Logger logger = Logger.getLogger(UtilisateurDAO.class.getName());

    public UtilisateurDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean ajouterUtilisateur(Utilisateur user) {
        String sql = "INSERT INTO Utilisateur (nom,prenom, email,telephone, motDePasse, profession) VALUES (?, ?, ?, ?,?,?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, user.getNom());
            stmt.setString(2, user.getPrenom());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getTelephone());
            stmt.setString(5, user.getMotDePasse()); // Attention : hacher les mots de passe
            stmt.setString(6, user.getProf());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

//    public List<Utilisateur> getAllUsers() {
//        List<Utilisateur> utilisateurs = new ArrayList<>();
//
//
//        String query = "SELECT * FROM Utilisateur";
//        try (PreparedStatement stmt = connection.prepareStatement(query);
//             ResultSet res = stmt.executeQuery()) {
//            while (res.next()) {
//                Utilisateur user = new Utilisateur(
//                        res.getInt("id"),
//                        res.getString("nom"),
//                        res.getString("email"),
//                        res.getString("role")
//                );
//                utilisateurs.add(user);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return utilisateurs;
//    }
public boolean emailExists(String email) throws SQLException {
    String sql = "SELECT COUNT(*) FROM Utilisateur WHERE email = ?";
    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        stmt.setString(1, email);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) > 0;
        }
    }
    return false;
}
    public Utilisateur authentifier(String email, String motDePasse) {
        String sql = "SELECT id, nom, email, motDePasse, prenom FROM Utilisateur WHERE email = ? AND motDePasse = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, motDePasse);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Utilisateur utilisateur = new Utilisateur();
                utilisateur.setId(rs.getInt("id"));
                utilisateur.setNom(rs.getString("nom"));
                utilisateur.setPrenom(rs.getString("prenom"));
                utilisateur.setEmail(rs.getString("email"));


                // Log response
                logger.info("This is an INFO log message");
                System.out.println("User authenticated: " + utilisateur);
                return utilisateur;
            }
        } catch (SQLException e) {
            System.out.println("Authentication failed for email: " + email);

            e.printStackTrace();
        }
        return null;
    }
}
