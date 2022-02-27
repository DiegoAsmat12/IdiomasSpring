package com.diegoasmat.servicios;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diegoasmat.modelos.Idioma;
import com.diegoasmat.repositorios.RepositorioIdiomas;

@Service
public class ServicioIdiomas {
	
	@Autowired
	private RepositorioIdiomas repositorioIdiomas;
	
	
	public List<Idioma> obtenerIdiomas(){
		return repositorioIdiomas.findAll();
	}
	
	public Idioma agregarIdioma(Idioma idioma) {
		return repositorioIdiomas.save(idioma);
	}
	
	
	public Idioma obtenerIdiomaPorId(Long id) {
		Optional<Idioma> idiomaObtenido = repositorioIdiomas.findById(id);
		if(idiomaObtenido.isPresent()) {
			return idiomaObtenido.get();
		}
		return null;
	}
	
	public Idioma actualizaIdioma(Idioma idioma) {
		Idioma idiomaObtenido = obtenerIdiomaPorId(idioma.getId());
		if(idiomaObtenido!=null) {
			return repositorioIdiomas.save(idioma);
		}
		return null;
	}
	
	public void eliminarIdioma(Long id) {
		repositorioIdiomas.deleteById(id);
	}
}
