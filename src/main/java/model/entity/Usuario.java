package model.entity;

import javax.persistence.*;

@Entity
@Table(name = "usuarios") // Nombre de la tabla en la base de datos
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id") // Columna que almacena el ID del usuario
	private Long id;

	@Column(name = "user") // Columna que almacena el nombre de usuario
	private String user;

	@Column(name = "password") // Columna que almacena la contraseña
	private String password;

	@Column(name = "email") // Columna que almacena la dirección de correo electrónico
	private String email;

	@Column(name = "rol") // Columna que almacena el rol del usuario (por ejemplo, "Cliente" o
							// "Administrador")
	private String rol;

	@Column(name = "tipo") // Columna que almacena el tipo de usuario (por ejemplo, "Cliente" o
							// "Administrador")
	private String tipo;

	@OneToOne(mappedBy = "usuario") // Relación de uno a uno con la entidad Cliente, se mapea en el atributo
									// "usuario" de Cliente
	private Cliente cliente;

	// Constructor nulo requerido por JPA
	public Usuario() {
	}

	// Constructor con parámetros para crear un usuario
	public Usuario(String user, String password, String email, String rol, String tipo) {
		this.user = user;
		this.password = password;
		this.email = email;
		this.rol = rol;
		this.tipo = tipo;
	}

	// Getters y Setters para cada atributo

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
}
