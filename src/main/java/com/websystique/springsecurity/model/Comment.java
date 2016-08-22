package com.websystique.springsecurity.model;






import org.springframework.data.mongodb.core.mapping.Document;



public class Comment  {
	private String txt;
    private Project project;
    private String project_id;
    private Utilisateur user;
    private String utilisateur;
	public String getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(String utilisateur) {
		this.utilisateur = utilisateur;
	}

	public Utilisateur getUser() {
		return user;
	}

	public void setUser(Utilisateur user) {
		this.user = user;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project proj) {
		this.project = proj;
	}

	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

}
