package triana.salesianos.dam.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import triana.salesianos.dam.model.Categoria;
import triana.salesianos.dam.model.Producto;

public interface ProductoRepositorio extends JpaRepository<Producto, Long> {
	
	public List <Producto> findByCategoriaId(Long id);
	
	public List<Producto> FindByNombreContainsIgnoreCase(String nombre);
	
	@Query("select count(p) from Producto p where p.categotia = ?1")
	public int findByNumProductosByCategoria(Categoria categoria);
	
}
