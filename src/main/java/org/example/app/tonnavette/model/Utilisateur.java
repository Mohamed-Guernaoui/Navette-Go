package org.example.app.tonnavette.model;

public class Utilisateur {
    private int id;
    private String nom;
    private String email;
    private String motDePasse;
    private String role; // "Client" ou "Société"
    private String telephone;
    private String prenom;

    public Utilisateur(
            int id, String nom, String email, String role, String telephone, String prenom
    ) {
        this.id = id;
        this.nom = nom;
        this.email = email;
        this.role = role;
        this.telephone = telephone;
        this.prenom = prenom;
    }

    public Utilisateur(String nom, String email, String motDePasse, String role) {
        this.nom = nom;
        this.email = email;
        this.motDePasse = motDePasse;
        this.role = role;
    }
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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
