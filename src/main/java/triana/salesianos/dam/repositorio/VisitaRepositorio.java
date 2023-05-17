package triana.salesianos.dam.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import triana.salesianos.dam.model.Visita;

public interface VisitaRepositorio extends JpaRepository<Visita, Long> {
	
	public List<Visita> findByVisitaId(Long id);
	

}
