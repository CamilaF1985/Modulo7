package model.entity;

import javax.persistence.*;

@Entity
@Table(name = "clientes")
public class Cliente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Usar GenerationType.IDENTITY para autoincremental
    private Integer id;

    @Column(name = "nombres", nullable = false)
    private String nombres;

    @Column(name = "apellidos", nullable = false)
    private String apellidos;

    @Column(name = "telefono", nullable = false)
    private long telefono;

    @Column(name = "comuna", nullable = false)
    private String comuna;

    @Column(name = "calle", nullable = false)
    private String calle;

    @Column(name = "numeracion", nullable = false)
    private Integer numeracion;

    @Column(name = "indicaciones", nullable = false)
    private String indicaciones;

	// Constructor nulo
	public Cliente() {
	}

	// Constructor con parámetros
	public Cliente(String nombres, String apellidos, long telefono, String comuna, String calle, Integer numeracion,
			String indicaciones) {
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.telefono = telefono;
		this.comuna = comuna;
		this.calle = calle;
		this.numeracion = numeracion;
		this.indicaciones = indicaciones;
	}

	// Getters y Setters para cada atributo

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		// Validación de longitud del nombre
		if (nombres.length() >= 5 && nombres.length() <= 30) {
			this.nombres = nombres;
		} else {
			System.out.println("Error: El nombre debe tener entre 5 y 30 caracteres.");
		}
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		// Validación de longitud del apellido
		if (apellidos.length() >= 5 && apellidos.length() <= 30) {
			this.apellidos = apellidos;
		} else {
			System.out.println("Error: El apellido debe tener entre 5 y 30 caracteres.");
		}
	}

	public long getTelefono() {
		return telefono;
	}

	public void setTelefono(long telefono) {
		// Validación del máximo de 15 dígitos para el teléfono
		if (String.valueOf(telefono).length() <= 15) {
			this.telefono = telefono;
		} else {
			System.out.println("Error: El teléfono debe tener como máximo 15 dígitos.");
		}
	}

	public String getComuna() {
		return comuna;
	}

	public void setComuna(String comuna) {
		// Validación de longitud de la comuna
		if (comuna.length() <= 30) {
			this.comuna = comuna;
		} else {
			System.out.println("Error: La comuna no puede tener más de 30 caracteres.");
		}
	}

	public String getCalle() {
		return calle;
	}

	public void setCalle(String calle) {
		// Validación de longitud de la calle
		if (calle.length() >= 5 && calle.length() <= 70) {
			this.calle = calle;
		} else {
			System.out.println("Error: La calle debe tener entre 5 y 70 caracteres.");
		}
	}

	public Integer getNumeracion() {
		return numeracion;
	}

	public void setNumeracion(Integer numeracion) {
		// Validación de que la numeración no sea nula
		if (numeracion != null) {
			this.numeracion = numeracion;
		} else {
			System.out.println("Error: La numeración no puede quedar nula.");
		}
	}

	public String getIndicaciones() {
		return indicaciones;
	}

	public void setIndicaciones(String indicaciones) {
		this.indicaciones = indicaciones;
	}

	}

