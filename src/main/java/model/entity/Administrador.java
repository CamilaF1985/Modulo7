package model.entity;

import javax.persistence.*;

@Entity
@Table(name = "administradores")
public class Administrador {

	// Identificador único generado automáticamente para cada administrador
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	// Número de identificación único del administrador
	@Column(name = "rut")
	private long rut;

	// Nombres del administrador
	@Column(name = "nombres")
	private String nombres;

	// Apellidos del administrador
	@Column(name = "apellidos")
	private String apellidos;

	// Fecha de ingreso del administrador
	@Column(name = "fecha_ingreso")
	private String fechaIngreso;

	// Relación uno a uno con la entidad Usuario para la autenticación
	@OneToOne
	@JoinColumn(name = "id_usuario")
	private Usuario usuario;

	// Constructor nulo para JPA
	public Administrador() {
	}

	// Constructor con parámetros para crear un administrador
	public Administrador(long rut, String nombres, String apellidos, String fechaIngreso, Usuario usuario) {
		this.rut = rut;
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.fechaIngreso = fechaIngreso;
		this.usuario = usuario;
	}

	// Métodos Getters para acceder a los atributos de la entidad

	public Long getId() {
		return id;
	}

	public long getRut() {
		return rut;
	}

	public String getNombres() {
		return nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public String getFechaIngreso() {
		return fechaIngreso;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	// Métodos Setters para actualizar los atributos de la entidad

	public void setId(Long id) {
		this.id = id;
	}

	public void setRut(long rut) {
		this.rut = rut;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public void setFechaIngreso(String fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}
