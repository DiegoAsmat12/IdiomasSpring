package com.diegoasmat.modelos;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "idioma")
public class Idioma {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message = "El nombre no puede ser vacío.")
	@Size(min = 2,max = 20,message = "El nombre debe tener como mínimo dos caracteres.")
	private String name;
	
	@NotBlank(message = "El creador no puede ser vacío.")
	@Size(min = 2,max = 20,message = "El creador debe tener como mínimo dos caracteres.")
	private String creator;
	
	@NotBlank(message="La versión no puede estar vacía.")
	private String currentVersion;
	
	public Idioma() {
		
	}

	public Idioma(String name, String creator,String currentVersion) {
		this.name = name;
		this.creator = creator;
		this.currentVersion = currentVersion;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getCurrentVersion() {
		return currentVersion;
	}

	public void setCurrentVersion(String currentVersion) {
		this.currentVersion = currentVersion;
	}
	
	
}
