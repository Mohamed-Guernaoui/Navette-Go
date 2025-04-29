package org.example.app.tonnavette.utility;

import org.example.app.tonnavette.model.Navette;

import java.sql.ResultSet;
import java.sql.SQLException;

public class NavetteMapper {
    public static Navette mapFromResultSet(ResultSet rs) throws SQLException {
        Navette n = new Navette();
        n.setId(rs.getInt("id"));
        n.setVilleDepart(rs.getString("villeDepart"));
        n.setVilleArrivee(rs.getString("villeArrivee"));
        n.setHeureDepart(rs.getString("heureDepart"));
        n.setHeureArrivee(rs.getString("heureArrivee"));
        n.setNombreAbonnes(rs.getInt("nombreAbonnes"));
        n.setCreatedAt(rs.getString("createdAt"));
        n.setStatus(Navette.NavetteStatus.fromString(rs.getString("status")));
        return n;
    }
}