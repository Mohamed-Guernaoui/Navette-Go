package org.example.app.tonnavette.model;

import java.util.Date;

public class Navette {
    private double price;
    private int id;
    private int societeId;
    private String villeDepart;
    private String villeArrivee;
    private String heureDepart;
    private String heureArrivee;
    private Date debutAbonnement;
    private Date finAbonnement;
    private int nombreSieges;
    private int nombreAbonnes;
    private String createdAt;
    private Entreprise societe;
    private int kilometers;
    private int seatsNumber;
    private String carModel;
    private String carPlate;
    private NavetteStatus status;

    // Getters and setters
    public double getPrice() {
        return price;
    }

    public String getCreatedAt(){
        return createdAt;
    }
    public void setCreatedAt(String createdAt){
        this.createdAt = createdAt;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getSocieteId() {
        return societeId;
    }
    public void setSocieteId(int societeId) {
        this.societeId = societeId;
    }
    public String getVilleDepart() {
        return villeDepart;
    }
    public void setVilleDepart(String villeDepart) {
        this.villeDepart = villeDepart;
    }
    public String getVilleArrivee() {
        return villeArrivee;
    }
    public void setVilleArrivee(String villeArrivee) {
        this.villeArrivee = villeArrivee;
    }
    public String getHeureDepart() {
        return heureDepart;
    }
    public void setHeureDepart(String heureDepart) {
        this.heureDepart = heureDepart;
    }
    public String getHeureArrivee() {
        return heureArrivee;

    }
    public void setHeureArrivee(String heureArrivee) {
        this.heureArrivee = heureArrivee;
    }

    public Date getDebutAbonnement() {
        return debutAbonnement;
    }

    public void setDebutAbonnement(Date debutAbonnement) {
        this.debutAbonnement = debutAbonnement;

    }

    public Date getFinAbonnement() {
        return finAbonnement;
    }

    public void setFinAbonnement(Date finAbonnement) {
        this.finAbonnement = finAbonnement;
    }
    public int getNombreSieges() {
        return nombreSieges;
    }
    public void setNombreSieges(int nombreSieges) {
        this.nombreSieges = nombreSieges;
    }
    public int getNombreAbonnes() {
        return nombreAbonnes;
    }
    public void setNombreAbonnes(int nombreAbonnes) {
        this.nombreAbonnes = nombreAbonnes;
    }

    public Entreprise getSociete() {
        return societe;
    }

    public void setSociete(Entreprise societe) {
        this.societe = societe;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getKilometers() {
        return kilometers;
    }

    public void setKilometers(int kilometers) {
        this.kilometers = kilometers;
    }

    public int getSeatsNumber() {
        return seatsNumber;
    }

    public void setSeatsNumber(int seatsNumber) {
        this.seatsNumber = seatsNumber;
    }

    public String getCarModel() {
        return carModel;
    }

    public void setCarModel(String carModel) {
        this.carModel = carModel;
    }

    public String getCarPlate() {
        return carPlate;
    }

    public void setCarPlate(String carPlate) {
        this.carPlate = carPlate;
    }

    public NavetteStatus getStatus() {
        return status;
    }

    public void setStatus(NavetteStatus status) {
        this.status = status;
    }

    public enum NavetteStatus {
        OPEN, CLOSED, UNKNOWN;

        public static NavetteStatus fromString(String status) {
            try {
                return valueOf(status.toUpperCase());
            } catch (IllegalArgumentException e) {
                return UNKNOWN; // Or throw a custom exception
            }
        }
    }

}
