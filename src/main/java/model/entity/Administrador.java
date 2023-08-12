package model.entity;

import javax.persistence.*;

@Entity
@Table(name = "administradores")
public class Administrador {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "rut")
    private long rut;

    @Column(name = "nombres")
    private String nombres;

    @Column(name = "apellidos")
    private String apellidos;

    @Column(name = "fecha_ingreso")
    private String fechaIngreso;

    @Column(name = "id_usuario")
    private Long idUsuario;

    // Constructor nulo
    public Administrador() {
    }

    public Administrador(long rut, String nombres, String apellidos, String fechaIngreso, Long idUsuario) {
        this.rut = rut;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.fechaIngreso = fechaIngreso;
        this.idUsuario = idUsuario;
    }

    // Getters

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

    public Long getIdUsuario() {
        return idUsuario;
    }

    // Setters

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

    public void setIdUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
    }
}

