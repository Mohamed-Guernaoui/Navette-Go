package org.example.app.tonnavette.dao;

import org.example.app.tonnavette.model.Entreprise;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EntrepriseDAO {
    private final Connection connection;

    public EntrepriseDAO(Connection connection) {
        this.connection = connection;
    }

    public Entreprise authentifier(String email, String motDePasse) {
        String sql = "SELECT * FROM Utilisateur WHERE email = ? AND motDePasse = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, motDePasse);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Entreprise societe = new Entreprise();
                societe.setEmail(rs.getString("email"));
                societe.setNom(rs.getString("nom"));

                return societe;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
