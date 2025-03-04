package org.example.app.tonnavette;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/navette_go";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private static Connection connection;

    public static Connection getConnection() {
        if (connection == null) {
            try {
                // ✅ Ensure MySQL Driver is loaded
                Class.forName("com.mysql.cj.jdbc.Driver");

                // ✅ Establish connection
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("✅ Connexion réussie !");
            } catch (ClassNotFoundException e) {
                System.err.println("❌ Driver MySQL introuvable !");
                e.printStackTrace();
            } catch (SQLException e) {
                System.err.println("❌ Erreur de connexion !");
                e.printStackTrace();
            }
        }
        return connection;
    }
}
