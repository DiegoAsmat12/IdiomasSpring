package com.diegoasmat.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.diegoasmat.modelos.Idioma;

@Repository
public interface RepositorioIdiomas extends CrudRepository<Idioma, Long> {
	List<Idioma> findAll();
}
