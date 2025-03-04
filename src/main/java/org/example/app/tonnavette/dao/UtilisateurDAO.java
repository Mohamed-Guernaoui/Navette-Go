package org.example.app.tonnavette.dao;

import org.example.app.tonnavette.model.Utilisateur;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UtilisateurDAO {
    private Connection connection;

    public UtilisateurDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean ajouterUtilisateur(Utilisateur user) {
        String sql = "INSERT INTO Utilisateur (nom, email, motDePasse, role) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, user.getNom());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getMotDePasse()); // Attention : hacher les mots de passe
            stmt.setString(4, user.getRole());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<Utilisateur> getAllUsers(){
        List<Utilisateur> utilisateurs = new ArrayList<>();


        String query = "SELECT * FROM Utilisateur";
            try(PreparedStatement stmt = connection.prepareStatement(query);
                ResultSet res = stmt.executeQuery()){
                while (res.next()) {
                    Utilisateur user = new Utilisateur(
                            res.getInt("id"),
                            res.getString("nom"),
                            res.getString("email"),
                            res.getString("role")
                    );
                    utilisateurs.add(user);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        return utilisateurs;
    }
    public Utilisateur authentifier(String email, String motDePasse) {
        String sql = "SELECT * FROM Utilisateur WHERE email = ? AND motDePasse = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, motDePasse);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Utilisateur(rs.getString("nom"), email, motDePasse, rs.getString("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
