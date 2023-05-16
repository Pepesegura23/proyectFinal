package triana.salesianos.dam.repositorio;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

import triana.salesianos.dam.model.Categoria;


public  interface CategoriaRepositorio extends JpaRepository<Categoria, Long>{
		abstract List<Categoria> findByNombreContainsIgnoreCase(String nombre);
	

}
