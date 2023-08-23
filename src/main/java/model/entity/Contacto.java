package model.entity;

import javax.persistence.*;

@Entity
@Table(name = "contacto")
public class Contacto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "nombre", nullable = false, length = 70)
	private String nombre;

	@Column(name = "email", nullable = false, length = 255)
	private String email;

	@Column(name = "comentario", length = 100)
	private String comentario;

	/**
	 * Constructor vacío de la entidad Contacto. Se utiliza para la creación de
	 * instancias sin parámetros iniciales.
	 */
	public Contacto() {
	}

	/**
	 * Constructor con parámetros de la entidad Contacto.
	 * 
	 * @param nombre     Nombre del contacto.
	 * @param email      Dirección de correo electrónico del contacto.
	 * @param comentario Comentario asociado al contacto.
	 */
	public Contacto(String nombre, String email, String comentario) {
		this.nombre = nombre;
		this.email = email;
		this.comentario = comentario;
	}

	/**
	 * Getter para el ID del contacto.
	 * 
	 * @return El ID del contacto.
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * Setter para el ID del contacto.
	 * 
	 * @param id El nuevo ID del contacto.
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * Getter para el nombre del contacto.
	 * 
	 * @return El nombre del contacto.
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * Setter para el nombre del contacto.
	 * 
	 * @param nombre El nuevo nombre del contacto.
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * Getter para el correo electrónico del contacto.
	 * 
	 * @return El correo electrónico del contacto.
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * Setter para el correo electrónico del contacto.
	 * 
	 * @param email El nuevo correo electrónico del contacto.
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * Getter para el comentario del contacto.
	 * 
	 * @return El comentario del contacto.
	 */
	public String getComentario() {
		return comentario;
	}

	/**
	 * Setter para el comentario del contacto.
	 * 
	 * @param comentario El nuevo comentario del contacto.
	 */
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
}
