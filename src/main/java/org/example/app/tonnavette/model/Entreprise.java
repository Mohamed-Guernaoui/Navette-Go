package org.example.app.tonnavette.model;

public class Entreprise {
    private int id;

    private String Nom;
    private String Email;
    private String hashedPassword;

    public Entreprise(int id, String nom, String email) {
        this.id = id;
        Nom = nom;
        Email = email;
    }


}
