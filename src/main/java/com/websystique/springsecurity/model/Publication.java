package com.websystique.springsecurity.model;

import java.util.List;

public class Publication {
	private String id;
	private String lib;
	private String desc;
	
	private String titre;
	private String cat;
	private Utilisateur user;
	private List<String> file_name;
	private List<String> file_size;
	private List<String> file_date;
	private List<String> file_type;
	
	
	public List<String> getFile_name() {
		return file_name;
	}
	public void setFile_name(List<String> file_name) {
		this.file_name = file_name;
	}
	public List<String> getFile_size() {
		return file_size;
	}
	public void setFile_size(List<String> file_size) {
		this.file_size = file_size;
	}
	public List<String> getFile_date() {
		return file_date;
	}
	public void setFile_date(List<String> file_date) {
		this.file_date = file_date;
	}
	public List<String> getFile_type() {
		return file_type;
	}
	public void setFile_type(List<String> file_type) {
		this.file_type = file_type;
	}
	public Utilisateur getUser() {
		return user;
	}
	public void setUser(Utilisateur user) {
		this.user = user;
	}
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLib() {
		return lib;
	}
	public void setLib(String lib) {
		this.lib = lib;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	

}
