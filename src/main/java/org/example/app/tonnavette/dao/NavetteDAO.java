package org.example.app.tonnavette.dao;

import org.example.app.tonnavette.model.Navette;
import org.example.app.tonnavette.model.Entreprise;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class NavetteDAO {
    private final Connection connection;
    private static final Logger logger = Logger.getLogger(NavetteDAO.class.getName());

    public NavetteDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Navette> getAllNavettes() throws SQLException {
        List<Navette> navettes = new ArrayList<>();
        String sql = "SELECT * FROM Navette";
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            System.out.println("Navette ID: " + rs);
            if (!rs.next()) {
                System.out.println("No Navette found");
            }
            while (rs.next()) {
                Navette n = new Navette();
                n.setId(rs.getInt("id"));
                n.setVilleDepart(rs.getString("villeDepart"));
                n.setVilleArrivee(rs.getString("villeArrivee"));
                n.setHeureDepart(rs.getString("heureDepart"));
                n.setHeureArrivee(rs.getString("heureArrivee"));
                n.setCreatedAt(rs.getString("createdAt"));
                navettes.add(n);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (Navette navette : navettes) {
            System.out.println("Navette ID: " + navette.getId() +
                    ", Depart: " + navette.getVilleDepart() +
                    ", Arrivee: " + navette.getVilleArrivee() +
                    ", Heure Depart: " + navette.getHeureDepart() +
                    ", Heure Arrivee: " + navette.getHeureArrivee());
        }

        return navettes;


    }

    public Navette getNavetteById(int id) {
        Navette navette = null;
        String sql = "SELECT " +
                "    n.id AS navette_id, " +
                "    n.villeDepart, " +
                "    n.villeArrivee, " +
                "    n.heureDepart, " +
                "    n.heureArrivee, " +
                "    n.debutAbonnement, " +
                "    n.finAbonnement, " +
                "    n.nombreSieges, " +
                "    n.nombreAbonnes, " +
                "    n.createdAt, " +
                "    e.id AS societe_id, " +
                "    e.nom AS societe_nom " +
                "FROM Navette n " +
                "JOIN Entreprise e ON n.societeId = e.id " +
                "WHERE n.id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);  // Set the ID parameter

            try (ResultSet rs = ps.executeQuery()) {
                System.out.println("Navette ID: " + rs);
                if (rs.next()) {
                    navette = new Navette(); // Create the Navette object
                    navette.setId(rs.getInt("navette_id"));
                    navette.setVilleDepart(rs.getString("villeDepart"));
                    navette.setVilleArrivee(rs.getString("villeArrivee"));
                    navette.setHeureDepart(rs.getString("heureDepart"));
                    navette.setHeureArrivee(rs.getString("heureArrivee"));
                    navette.setDebutAbonnement(rs.getString("debutAbonnement"));
                    navette.setFinAbonnement(rs.getString("finAbonnement"));
                    navette.setNombreSieges(rs.getInt("nombreSieges"));
                    navette.setNombreAbonnes(rs.getInt("nombreAbonnes"));
                    navette.setCreatedAt(rs.getString("createdAt"));
                    // Setting the associated Entreprise
                    Entreprise societe = new Entreprise();
                    societe.setId(rs.getInt("societe_id"));
                    societe.setNom(rs.getString("societe_nom"));
                    navette.setSociete(societe);

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Navette ID: " +
                ", Depart: " + navette.getVilleDepart() +
                ", Arrivee: " + navette.getVilleArrivee() +
                ", Heure Depart: " + navette.getHeureDepart() +
                ", Heure Arrivee: " + navette.getHeureArrivee());


        return navette;
    }

    public List<Navette> searchNavettes(String query) {
        List<Navette> navettes = new ArrayList<>();
        String sql = "SELECT * FROM Navette WHERE villeDepart LIKE ? OR villeArrivee LIKE ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, "%" + query + "%");
            ps.setString(2, "%" + query + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Navette n = new Navette();
                n.setId(rs.getInt("id"));
                n.setVilleDepart(rs.getString("villeDepart"));
                n.setVilleArrivee(rs.getString("villeArrivee"));
                n.setHeureDepart(rs.getString("heureDepart"));
                n.setHeureArrivee(rs.getString("heureArrivee"));
                n.setCreatedAt(rs.getString("createdAt"));
                navettes.add(n);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return navettes;
    }


}
