package com.websystique.springsecurity.model;

public class Paiement {
	private String user;
	private double montant;
	private String date;
	private String etat;
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public double getMontant() {
		return montant;
	}
	public void setMontant(double montatnt) {
		this.montant = montatnt;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}

}
