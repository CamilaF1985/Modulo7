package model.entity;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "clientes")
public class Cliente {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nombres")
    private String nombres;
    @Column(name = "apellidos")
    private String apellidos;
    @Column(name = "telefono")
    private long telefono;
    @Column(name = "comuna")
    private String comuna;
    @Column(name = "calle")
    private String calle;
    @Column(name = "numeracion")
    private Integer numeracion;
    @Column(name = "indicaciones")
    private String indicaciones;
    
    @OneToOne
    @JoinColumn(name = "id_usuario")
    private Usuario usuario;
    
    @OneToMany(mappedBy = "cliente")
    private List<Pedido> pedidos;
    
	// Constructor nulo
	public Cliente() {
	}

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

    // Getters y Setters para cada atributo

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public long getTelefono() {
        return telefono;
    }

    public void setTelefono(long telefono) {
        this.telefono = telefono;
    }

    public String getComuna() {
        return comuna;
    }

    public void setComuna(String comuna) {
        this.comuna = comuna;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public Integer getNumeracion() {
        return numeracion;
    }

    public void setNumeracion(Integer numeracion) {
        this.numeracion = numeracion;
    }

    public String getIndicaciones() {
        return indicaciones;
    }

    public void setIndicaciones(String indicaciones) {
        this.indicaciones = indicaciones;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
}

