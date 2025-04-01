package org.example.app.tonnavette.model;

public class Entreprise {
    private int id;

    private String Nom;
    private String Email;
    private String hashedPassword;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return Nom;
    }

    public void setNom(String nom) {
        Nom = nom;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getHashedPassword() {
        return hashedPassword;
    }


}
