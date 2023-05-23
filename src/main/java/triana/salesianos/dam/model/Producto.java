package triana.salesianos.dam.model;

import jakarta.annotation.Generated;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Producto {

		@Id
		@GeneratedValue
		private long id;
		private String nombre;
		private double pvp;
		private String descripcion;
		private int stock;
		private String url;
		
		@ManyToOne
		private Categoria categoria;
		
		public Producto(String nombre, double pvp,String descripcion,int stock, String url, Categoria categoria) {
			super();
		this.nombre = nombre;
		this.pvp = pvp;
		this.descripcion = descripcion;
		this.stock = stock;
		this.url = url;
		this.categoria = categoria;
		
		}
		
}
