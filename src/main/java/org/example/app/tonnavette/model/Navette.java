package org.example.app.tonnavette.model;

public class Navette {
    private int id;
    private int societeId;
    private String villeDepart;
    private String villeArrivee;
    private String heureDepart;
    private String heureArrivee;
    private String debutAbonnement;
    private String finAbonnement;
    private int nombreSieges;
    private int nombreAbonnes;
    private String createdAt;
    private Entreprise societe;

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
    public String getDebutAbonnement() {
        return debutAbonnement;
    }
    public void setDebutAbonnement(String debutAbonnement) {
        this.debutAbonnement = debutAbonnement;

    }
    public String getFinAbonnement() {
        return finAbonnement;
    }
    public void setFinAbonnement(String finAbonnement) {
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

}
