package triana.salesianos.dam.model;

import java.time.LocalDate;
import java.time.LocalTime;
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
public class Venta {

	@Id
	@GeneratedValue
	private long id;
	
	@ToString.Exclude
	@EqualsAndHashCode.Exclude
	@OneToMany ( mappedBy = "venta", fetch = FetchType.EAGER)
	@Builder.Default
	private List <LineaDeVenta> lineaDeVenta = new ArrayList<LineaDeVenta>();
	private LocalDate fecha;
	private LocalTime hora;
	private double total;
}
