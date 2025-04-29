package org.example.app.tonnavette.model;

public class Utilisateur {
    private int id;
    private String nom;
    private String email;
    private String motDePasse;
    private String prof; // "Client" ou "Société"
    private String telephone;
    private String prenom;


    public Utilisateur(
            int id, String nom, String email, String prof, String telephone, String prenom
    ) {
        this.id = id;
        this.nom = nom;
        this.email = email;
        this.prof = prof;
        this.telephone = telephone;
        this.prenom = prenom;
    }

    public Utilisateur() {
    }

//    public Utilisateur(String nom, String email, String motDePasse, String prof) {
//        this.nom = nom;
//        this.email = email;
//        this.motDePasse = motDePasse;
//        this.prof = prof;
//    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String getMotDePasse() {
        return motDePasse;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }

    public String getProf() {
        return prof;
    }

    public void setProf(String prof) {
        this.prof = prof;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }





    // Getters et Setters
}
