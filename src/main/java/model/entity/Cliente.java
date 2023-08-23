package model.entity;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "clientes")
public class Cliente {

	// Identificador único generado automáticamente para cada cliente
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	// Nombres del cliente
	@Column(name = "nombres")
	private String nombres;

	// Apellidos del cliente
	@Column(name = "apellidos")
	private String apellidos;

	// Número de teléfono del cliente
	@Column(name = "telefono")
	private long telefono;

	// Comuna en la que reside el cliente
	@Column(name = "comuna")
	private String comuna;

	// Calle de la dirección del cliente
	@Column(name = "calle")
	private String calle;

	// Numeración de la dirección del cliente
	@Column(name = "numeracion")
	private Integer numeracion;

	// Indicaciones adicionales para la dirección del cliente
	@Column(name = "indicaciones")
	private String indicaciones;

	// Relación uno a uno con la entidad Usuario para la autenticación
	@OneToOne
	@JoinColumn(name = "id_usuario")
	private Usuario usuario;

	// Relación uno a muchos con la entidad Pedido para representar los pedidos del
	// cliente
	@OneToMany(mappedBy = "cliente")
	private List<Pedido> pedidos;

	// Constructor nulo para JPA
	public Cliente() {
	}

	// Constructor con parámetros para crear un cliente
	public Cliente(String nombres, String apellidos, long telefono, String comuna, String calle, Integer numeracion,
			String indicaciones, Usuario usuario) {
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.telefono = telefono;
		this.comuna = comuna;
		this.calle = calle;
		this.numeracion = numeracion;
		this.indicaciones = indicaciones;
		this.usuario = usuario;
	}

	// Métodos Getters para acceder a los atributos de la entidad

	public Long getId() {
		return id;
	}

	public String getNombres() {
		return nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public long getTelefono() {
		return telefono;
	}

	public String getComuna() {
		return comuna;
	}

	public String getCalle() {
		return calle;
	}

	public Integer getNumeracion() {
		return numeracion;
	}

	public String getIndicaciones() {
		return indicaciones;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	// Métodos Setters para actualizar los atributos de la entidad

	public void setId(Long id) {
		this.id = id;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public void setTelefono(long telefono) {
		this.telefono = telefono;
	}

	public void setComuna(String comuna) {
		this.comuna = comuna;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public void setNumeracion(Integer numeracion) {
		this.numeracion = numeracion;
	}

	public void setIndicaciones(String indicaciones) {
		this.indicaciones = indicaciones;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}
