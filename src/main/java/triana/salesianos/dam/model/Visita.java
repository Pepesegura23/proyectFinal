package triana.salesianos.dam.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Visita {
	
	@Id
	@GeneratedValue
	private Long num_visita ;
	
	private String nombre;
	private LocalDate fecha;
	private String descripcion;

}
