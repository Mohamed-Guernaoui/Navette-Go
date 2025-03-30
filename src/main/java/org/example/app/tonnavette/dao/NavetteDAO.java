package org.example.app.tonnavette.dao;

import org.example.app.tonnavette.model.Navette;

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
        try( PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()){
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
        }
        catch (SQLException e) {
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
        String sql = "SELECT * FROM Navette WHERE id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);  // Set the ID parameter

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    navette = new Navette(); // Create the Navette object
                    navette.setId(rs.getInt("id"));
                    navette.setVilleDepart(rs.getString("villeDepart"));
                    navette.setVilleArrivee(rs.getString("villeArrivee"));
                    navette.setHeureDepart(rs.getString("heureDepart"));
                    navette.setHeureArrivee(rs.getString("heureArrivee"));
                    navette.setCreatedAt(rs.getString("createdAt"));
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

}
