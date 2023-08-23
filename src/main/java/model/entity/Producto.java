package model.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "productos")
public class Producto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	private String nombre; // Nombre del producto
	private String categoria; // Categoría a la que pertenece el producto
	private Integer precio; // Precio del producto

	private String imagenUrl; // URL de la imagen del producto

	@OneToMany(mappedBy = "producto")
	private List<PedidosProductos> pedidosProductos; // Relación de uno a muchos con la entidad PedidosProductos

	// Constructor nulo requerido por JPA
	public Producto() {
	}

	// Getter y Setter para ID
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	// Getter y Setter para Nombre
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	// Getter y Setter para Categoría
	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	// Getter y Setter para Precio
	public Integer getPrecio() {
		return precio;
	}

	public void setPrecio(Integer precio) {
		this.precio = precio;
	}

	// Getter y Setter para URL de Imagen
	public String getImagenUrl() {
		return imagenUrl;
	}

	public void setImagenUrl(String imagenUrl) {
		this.imagenUrl = imagenUrl;
	}

	// Getter y Setter para la lista de PedidosProductos
	public List<PedidosProductos> getPedidosProductos() {
		return pedidosProductos;
	}

	public void setPedidosProductos(List<PedidosProductos> pedidosProductos) {
		this.pedidosProductos = pedidosProductos;
	}
}
