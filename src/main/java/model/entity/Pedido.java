package model.entity;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "pedidos")
public class Pedido {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@Column(name = "indicaciones")
	private String indicaciones;

	@Column(name = "precio_total")
	private Integer precioTotal;

	@Column(name = "estado")
	private String estado;

	@Column(name = "fecha_ingreso")
	private LocalDateTime fechaIngreso;

	@Column(name = "fecha_despacho")
	private LocalDateTime fechaDespacho;

	@OneToOne
	@JoinColumn(name = "cliente_id")
	private Cliente cliente; // Relación de uno a uno con la entidad Cliente

	@OneToMany(mappedBy = "pedido")
	private List<PedidosProductos> pedidosProductos; // Relación de uno a muchos con la entidad PedidosProductos

	// Getter para ID
	public Long getId() {
		return id;
	}

	// Getter y Setter para Indicaciones
	public String getIndicaciones() {
		return indicaciones;
	}

	public void setIndicaciones(String indicaciones) {
		this.indicaciones = indicaciones;
	}

	// Getter y Setter para Precio Total
	public Integer getPrecioTotal() {
		return precioTotal;
	}

	public void setPrecioTotal(Integer precioTotal) {
		this.precioTotal = precioTotal;
	}

	// Getter y Setter para Estado
	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	// Getter y Setter para Fecha de Ingreso
	public LocalDateTime getFechaIngreso() {
		return fechaIngreso;
	}

	public void setFechaIngreso(LocalDateTime fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}

	// Getter y Setter para Fecha de Despacho
	public LocalDateTime getFechaDespacho() {
		return fechaDespacho;
	}

	public void setFechaDespacho(LocalDateTime fechaDespacho) {
		this.fechaDespacho = fechaDespacho;
	}

	// Getter y Setter para Cliente
	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	// Getter y Setter para Lista de Pedidos de Productos
	public List<PedidosProductos> getPedidosProductos() {
		return pedidosProductos;
	}

	public void setPedidosProductos(List<PedidosProductos> pedidosProductos) {
		this.pedidosProductos = pedidosProductos;
	}
}
