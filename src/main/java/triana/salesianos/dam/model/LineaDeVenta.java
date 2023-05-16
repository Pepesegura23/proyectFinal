package triana.salesianos.dam.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LineaDeVenta {

	@Id
	@GeneratedValue
	private long id;
	@OneToOne
	private Producto producto;
	private int cantidad;
	private double subtotal;
	@ManyToOne
	private Venta venta;
	
	public void addToVenta (Venta venta) {
		this.venta = venta;
		venta.getLineaDeVenta().add(this);
		
	}
	public void removeFromVenta(Venta venta) {
		venta.getLineaDeVenta().remove(this);
		this.venta = null;
	}
}
