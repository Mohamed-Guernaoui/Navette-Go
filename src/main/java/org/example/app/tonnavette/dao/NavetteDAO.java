package org.example.app.tonnavette.dao;

import org.example.app.tonnavette.model.Navette;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NavetteDAO {
    private Connection connection;

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
                n.setVilleDepart(rs.getString("Ville_Départ"));
                n.setVilleArrivee(rs.getString("Ville_Arrivée"));
                n.setHeureDepart(rs.getString("Heure_Départ"));
                navettes.add(n);
            }
            return navettes;
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

    return navettes;

    }
}
