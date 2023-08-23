package model.entity;

import javax.persistence.*;

@Entity
@Table(name = "pedidos_productos")
public class PedidosProductos {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	@JoinColumn(name = "pedido_id")
	private Pedido pedido; // Relación de muchos a uno con la entidad Pedido

	@ManyToOne
	@JoinColumn(name = "producto_id")
	private Producto producto; // Relación de muchos a uno con la entidad Producto

	private int cantidad;

	// Constructor nulo requerido por JPA
	public PedidosProductos() {
	}

	// Constructor con parámetros para inicializar las relaciones y cantidad
	public PedidosProductos(Pedido pedido, Producto producto, int cantidad) {
		this.pedido = pedido;
		this.producto = producto;
		this.cantidad = cantidad;
	}

	// Getter para ID
	public Long getId() {
		return id;
	}

	// Setter para ID
	public void setId(Long id) {
		this.id = id;
	}

	// Getter y Setter para Pedido
	public Pedido getPedido() {
		return pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

	// Getter y Setter para Producto
	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	// Getter y Setter para Cantidad
	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
}
