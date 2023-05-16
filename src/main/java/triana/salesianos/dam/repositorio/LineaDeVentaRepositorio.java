package triana.salesianos.dam.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import triana.salesianos.dam.model.LineaDeVenta;
import triana.salesianos.dam.model.Producto;

public interface LineaDeVentaRepositorio extends JpaRepository<LineaDeVenta, Long> {
	
	public List<LineaDeVenta> findByVentaId(Long id);
	
	@Query("select count(ln) from LineaDeVenta LN where ln.Producto = ?1")
	public int findNumLineaDeVentaVyProducto(Producto producto);

}
