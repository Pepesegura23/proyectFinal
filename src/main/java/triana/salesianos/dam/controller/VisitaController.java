package triana.salesianos.dam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import triana.salesianos.dam.model.Visita;
import triana.salesianos.dam.repositorio.VisitaRepositorio;

@Controller
public class VisitaController {

    private VisitaRepositorio visitaRepositorio;

    @Autowired
    public VisitaController(VisitaRepositorio visitaRepositorio) {
        this.visitaRepositorio = visitaRepositorio;
    }

    @GetMapping("/admin/visitas")
    public String mostrarVisitas(Model model) {
        List<Visita> visitas = visitaRepositorio.findAll();
        model.addAttribute("visitas", visitas);
        return "admin/visitas";
    }
}

