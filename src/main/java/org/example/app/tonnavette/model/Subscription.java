package org.example.app.tonnavette.model;

import java.time.LocalDateTime;

public class Subscription {
    private int id;
    private int userId;
    private int navId;
    private LocalDateTime subscribedAt;
    private String pickupPoint;


    // Constructors
    public Subscription() {
    }

    public Subscription(int id, int userId, int navId, LocalDateTime subscribedAt) {
        this.id = id;
        this.userId = userId;
        this.navId = navId;
        this.subscribedAt = subscribedAt;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPickupPoint() {
        return pickupPoint;
    }

    public void setPickupPoint(String pickupPoint) {
        this.pickupPoint = pickupPoint;
    }

    public int getNavetteId() {
        return navId;
    }

    public void setNavetteId(int navId) {
        this.navId = navId;
    }

    public LocalDateTime getSubscribedAt() {
        return subscribedAt;
    }

    public void setSubscribedAt(LocalDateTime subscribedAt) {
        this.subscribedAt = subscribedAt;
    }
}
