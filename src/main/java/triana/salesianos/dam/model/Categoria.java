package triana.salesianos.dam.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Categoria {

	@Id
	@GeneratedValue
	private long id;
	private String nombre;
	@Builder.Default
	@ToString.Exclude
	@EqualsAndHashCode.Exclude
	@OneToMany(mappedBy="categoria", fetch= FetchType.EAGER)
	private List <Producto> productos = new ArrayList<>();
	
	public Categoria(String nombre, List<Producto> productos) {
		super();
		this.nombre = nombre;
		this.productos = productos;
	}
}
