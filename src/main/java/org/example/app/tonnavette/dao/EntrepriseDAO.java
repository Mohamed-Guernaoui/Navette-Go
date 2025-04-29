package org.example.app.tonnavette.dao;

import org.example.app.tonnavette.model.Entreprise;
import org.example.app.tonnavette.model.Navette;
import org.example.app.tonnavette.model.Subscription;
import org.example.app.tonnavette.utility.NavetteMapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EntrepriseDAO {
    private final Connection connection;

    public EntrepriseDAO(Connection connection) {
        this.connection = connection;
    }

    public Entreprise authentifier(String email, String password) {
        String sql = "SELECT * FROM entreprise WHERE email = ? AND password = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Entreprise partner = new Entreprise();
                partner.setId(rs.getInt("id"));
                partner.setEmail(rs.getString("email"));
                partner.setName(rs.getString("name"));
                partner.setHashedPassword(rs.getString("password"));
                return partner;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean emailExists(String email) throws SQLException {
        String sql = "SELECT COUNT(*) FROM entreprise WHERE Email = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }

    public boolean createEntreprise(Entreprise entreprise) {
        String sql = "INSERT INTO Entreprise (name, email, phone_number, contact_person, fleet_size, operating_areas, company_type, password) VALUES ( ?, ?, ?, ?,?,?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, entreprise.getName());
            ps.setString(2, entreprise.getEmail());
            ps.setString(4, entreprise.getPhoneNumber());
            ps.setString(5, entreprise.getContactPerson());
            ps.setString(6, entreprise.getFleetSize());
            ps.setString(7, entreprise.getOperatingAreas());
            ps.setString(8, entreprise.getCompanyType());
            ps.setString(3, entreprise.getHashedPassword());



            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Failed to create entreprise");
            e.printStackTrace();
            return false;
        }
    }

    public List<Navette> getNavettesByPartner(int partnerId) throws SQLException {
        List<Navette> navettes = new ArrayList<>();
        String sql = "SELECT * FROM navette WHERE societeId = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, partnerId);
            ResultSet rs = stmt.executeQuery();
            System.out.println("partnerId " + partnerId);
            while (rs.next()) {
                Navette n = NavetteMapper.mapFromResultSet(rs);
                navettes.add(n);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return navettes;
    }

    public Entreprise getPartnerById(int id) {
        String sql = "SELECT id, Email,name ,contact_person from entreprise WHERE id = ?";
        Entreprise partner = new Entreprise();

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);  // Set the ID parameter

            try (ResultSet rs = ps.executeQuery()) {
                System.out.println("Navette ID: " + rs);

                if (rs.next()) {
                    // Setting the associated Entreprise
                    partner.setId(rs.getInt("id"));
                    partner.setName(rs.getString("name"));
                    partner.setEmail(rs.getString("email"));
                    partner.setContactPerson(rs.getString("contact_person"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return partner;
    }


    public Map<String, Double> getRevenueStats(int partnerId, String period) throws SQLException {
        Map<String, Double> stats = new HashMap<>();
        String sql = """
                SELECT 
                    SUM(amount) AS total_revenue,
                    COUNT(*) AS booking_count
                FROM payments p
                JOIN subscriptions s ON p.subscription_id = s.id
                JOIN routes r ON s.route_id = r.id
                JOIN shuttles sh ON r.shuttle_id = sh.id
                WHERE sh.partner_id = ? AND p.status = 'COMPLETED'
                """;

        // Add time filter based on period (monthly, yearly, etc.)
        switch (period) {
            case "monthly":
                sql += " AND p.payment_date >= DATE_SUB(NOW(), INTERVAL 1 MONTH)";
                break;
            case "yearly":
                sql += " AND p.payment_date >= DATE_SUB(NOW(), INTERVAL 1 YEAR)";
                break;
        }

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, partnerId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                stats.put("total_revenue", rs.getDouble("total_revenue"));
                stats.put("booking_count", (double) rs.getInt("booking_count"));
            }
        }
        return stats;
    }


    /**
     //     * Get all active bookings for a partner's routes
     //     */
//    public List<Subscription> getActiveBookings(int partnerId) throws SQLException {
//        List<Subscription> bookings = new ArrayList<>();
//        String sql = """
//            SELECT s.* FROM subscription s
//            JOIN navette n ON s.navId = n.id
//            WHERE n.partnerId = ? AND n.status = 'OPEN'
//            """;
//
//        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
//            stmt.setInt(1, partnerId);
//            ResultSet rs = stmt.executeQuery();
//
//            while (rs.next()) {
//                Subscription booking = new Subscription();
//
//                bookings.add(booking);
//            }
//        }
//        return bookings;
//    }

}
