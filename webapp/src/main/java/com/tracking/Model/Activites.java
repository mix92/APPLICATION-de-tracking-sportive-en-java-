package com.tracking.Model;

import java.util.Date;

public class Activites {

	private String id;
	private String nomActivite;
	private String iduser;
	private Date date;
	
	public String getId() {
		return id;
	}

	public String getNomActivite() {
		return nomActivite;
	}
	public void setNomActivite(String nomActivite) {
		this.nomActivite = nomActivite;
	}
	public String getIduser() {
		return iduser;
	}
	public void setIduser(String iduser) {
		this.iduser = iduser;
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
