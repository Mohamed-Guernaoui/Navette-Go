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
        String sql = "SELECT * FROM entreprise WHERE Email = ? AND Mot_de_passe = ?";
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

    public boolean createEntreprise(Entreprise entreprise) {
        String sql = "INSERT INTO Entreprise (Nom, Email, phone_number, contact_person, fleet_size, operating_areas, company_type, Mot_de_passe) VALUES ( ?, ?, ?, ?,?,?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, entreprise.getNom());
            ps.setString(2, entreprise.getEmail());
            ps.setString(3, entreprise.getHashedPassword());
            ps.setString(4, entreprise.getPhoneNumber());
            ps.setString(5, entreprise.getContactPerson());
            ps.setString(6, entreprise.getFleetSize());
            ps.setString(7, entreprise.getOperatingAreas());
            ps.setString(8, entreprise.getCompanyType());


            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Failed to create entreprise");
            e.printStackTrace();
            return false;
        }
    }


}
