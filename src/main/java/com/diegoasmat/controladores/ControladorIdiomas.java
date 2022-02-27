package com.diegoasmat.controladores;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.diegoasmat.modelos.Idioma;
import com.diegoasmat.servicios.ServicioIdiomas;

@Controller
@RequestMapping("/languages")
public class ControladorIdiomas {

	@Autowired
	private ServicioIdiomas servicioIdiomas;
	
	
	@GetMapping("")
	public String getindex(Model model, @ModelAttribute(name = "idioma")Idioma idioma) {
		List<Idioma> listaIdiomas = servicioIdiomas.obtenerIdiomas();
		model.addAttribute("listaIdiomas", listaIdiomas);
		return "index.jsp";
	}
	
	@GetMapping("/{id}")
	public String muestraIdioma(Model model, @PathVariable("id") Long id) {
		Idioma idioma = servicioIdiomas.obtenerIdiomaPorId(id);
		model.addAttribute("idioma",idioma);
		
		return "idioma.jsp";
	}
	
	@GetMapping("/{id}/edit")
	public String muestraEditForm(Model model, @PathVariable("id")Long id) {
		Idioma idioma = servicioIdiomas.obtenerIdiomaPorId(id);
		model.addAttribute("idioma",idioma);
		
		return "edit.jsp";
	}
	
	@PostMapping("")
	public String createLanguage(@Valid @ModelAttribute("idioma") Idioma idioma, BindingResult result) {
		if(result.hasErrors()) {
			return "index.jsp";
		}
		servicioIdiomas.agregarIdioma(idioma);
		
		return "redirect:/languages";
		
	}
	
	@PutMapping("/{id}")
	public String editarIdioma(@Valid @ModelAttribute("idioma") Idioma idioma, BindingResult result) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		servicioIdiomas.actualizaIdioma(idioma);
		
		return "redirect:/languages";
	}
	
	@DeleteMapping("/{id}")
	public String eliminarIdioma(@PathVariable("id") Long id) {
		servicioIdiomas.eliminarIdioma(id);
		return "redirect:/languages";
	}
}
