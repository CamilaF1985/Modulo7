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

    @Column(name= "comentario", length = 100)
    private String comentario;

    // Constructor nulo
    public Contacto() {
    }

    // Constructor con parámetros
    public Contacto(String nombre, String email, String comentario) {
        this.nombre = nombre;
        this.email = email;
        this.comentario = comentario;
    }

    // Getters y setters

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
}


