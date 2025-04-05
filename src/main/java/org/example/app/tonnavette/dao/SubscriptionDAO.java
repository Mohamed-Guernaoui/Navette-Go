package org.example.app.tonnavette.dao;

import org.example.app.tonnavette.model.Subscription;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SubscriptionDAO {
    private final Connection connection;

    public SubscriptionDAO(Connection connection) {
        this.connection = connection;
    }

    public void addSubscription(Subscription subscription) throws SQLException {
        String sql = "INSERT INTO Subscription (user_id, nav_id, subscribed_at) VALUES (?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, subscription.getUserId());
            ps.setInt(2, subscription.getNavetteId());
            ps.setTimestamp(3, Timestamp.valueOf(subscription.getSubscribedAt()));
            ps.executeUpdate();
        }
    }

    public List<Subscription> getSubscriptionsByUserId(int userId) throws SQLException {
        List<Subscription> subscriptions = new ArrayList<>();
        String sql = "SELECT * FROM subscriptions WHERE user_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Subscription s = new Subscription();
                    s.setId(rs.getInt("id"));
                    s.setUserId(rs.getInt("user_id"));
                    s.setNavetteId(rs.getInt("navette_id"));
                    s.setSubscribedAt(rs.getTimestamp("subscribed_at").toLocalDateTime());
                    subscriptions.add(s);
                }
            }
        }
        return subscriptions;
    }

    public boolean isUserSubscribed(int userId, int navetteId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM subscriptions WHERE user_id = ? AND navette_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, navetteId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
}
