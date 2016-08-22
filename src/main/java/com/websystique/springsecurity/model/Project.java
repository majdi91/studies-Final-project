package com.websystique.springsecurity.model;



import java.util.Date;

import com.mongodb.BasicDBObject;

public class Project{
	private String project_id;
	private String titre;
	private String etat;
	private double budget;
	private String desc;
	private String cat;
	private String date_deb;
	private String date_fin;
	private Integer avancement;
	public String getDate_deb() {
		return date_deb;
	}
	public void setDate_deb(String date_deb) {
		this.date_deb = date_deb;
	}
	public String getDate_fin() {
		return date_fin;
	}
	public void setDate_fin(String date_fin) {
		this.date_fin = date_fin;
	}
	public Integer getAvancement() {
		return avancement;
	}
	public void setAvancement(Integer avancement) {
		this.avancement = avancement;
	}
	public String getId() {
		return project_id;
	}
	public void setId(String project_id) {
		this.project_id = project_id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}
	public double getBudget() {
		return budget;
	}
	public void setBudget(double budget) {
		this.budget = budget;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}

}
