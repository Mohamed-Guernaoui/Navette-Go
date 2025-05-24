package org.example.app.tonnavette.dao;

import org.example.app.tonnavette.model.Navette;
import org.example.app.tonnavette.model.Entreprise;
import org.example.app.tonnavette.utility.NavetteMapper;

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
            while (rs.next()) {
                Navette n = NavetteMapper.mapFromResultSet(rs);
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
                "    e.name AS societe_nom, " +
                " n.status  ," +
                " n.car_plate  ," +
                " n.car_model  ," +
                " n.seats_number ," +
                " n.price ," +
                " n.kilometers , " +
                " n.car_brand  " +


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
                    navette.setDebutAbonnement(rs.getDate("debutAbonnement"));
                    navette.setFinAbonnement(rs.getDate("finAbonnement"));
                    navette.setNombreSieges(rs.getInt("nombreSieges"));
                    navette.setNombreAbonnes(rs.getInt("nombreAbonnes"));
                    navette.setCreatedAt(rs.getString("createdAt"));
                    navette.setPrice(rs.getDouble("price"));
                    navette.setKilometers(rs.getInt("kilometers"));
                    navette.setSeatsNumber(rs.getInt("seats_number"));
                    navette.setCarModel(rs.getString("car_model"));
                    navette.setCarPlate(rs.getString("car_plate"));
                    navette.setCarPlate(rs.getString("car_brand"));

                    navette.setStatus(Navette.NavetteStatus.valueOf(rs.getString("status")));
                    // Setting the associated Entreprise
                    Entreprise societe = new Entreprise();
                    societe.setId(rs.getInt("societe_id"));
                    societe.setName(rs.getString("societe_nom"));
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
                Navette n = NavetteMapper.mapFromResultSet(rs);
                navettes.add(n);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return navettes;
    }

    public boolean createShuttle(Navette navette) throws SQLException {
        String sql = "INSERT INTO navette ( villeDepart, villeArrivee, heureDepart,heureArrivee, debutAbonnement, finAbonnement, nombreSieges,car_model,car_plate,status,price,kilometers,societeId )VALUES (?,?, ?, ?, ?, ?,?,?, ?, ?,?,?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, navette.getVilleDepart());
            stmt.setString(2, navette.getVilleArrivee());
            stmt.setString(3, navette.getHeureDepart());
            stmt.setString(4, navette.getHeureArrivee());
            stmt.setDate(5, new java.sql.Date(navette.getDebutAbonnement().getTime()));
            stmt.setDate(6, new java.sql.Date(navette.getFinAbonnement().getTime()));
            stmt.setInt(7, navette.getNombreSieges());
            stmt.setString(8, navette.getCarModel());
            stmt.setString(9, navette.getCarPlate());
            stmt.setString(10, navette.getStatus().toString());
            stmt.setDouble(11, navette.getPrice());
            stmt.setInt(12, navette.getKilometers());
            stmt.setInt(13, navette.getSocieteId());


            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}




