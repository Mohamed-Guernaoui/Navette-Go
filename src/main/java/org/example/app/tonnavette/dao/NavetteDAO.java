package org.example.app.tonnavette.dao;

import org.example.app.tonnavette.model.Navette;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class NavetteDAO {
    private Connection connection;
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

}
