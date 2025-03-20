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
                n.setHeureDepart(rs.getString("heureArrivee"));
                n.setHeureArrivee(rs.getString("createdAt"));
                System.out.println("DEBUG ~ " + rs.getString("villeArrivee"));

                navettes.add(n);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("GET/index ~ NAVETTES " + navettes);

        return navettes;


    }

}
