package model.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "productos")
public class Producto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    private String nombre;
    private String categoria;
    private Integer precio;
    
    @OneToMany(mappedBy = "producto")
    private List<PedidosProductos> pedidosProductos;

    // Constructor, getters y setters

    public Producto() {
        // Constructor nulo requerido por JPA
    }

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

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Integer getPrecio() {
        return precio;
    }

    public void setPrecio(Integer precio) {
        this.precio = precio;
    }

    public List<PedidosProductos> getPedidosProductos() {
        return pedidosProductos;
    }

    public void setPedidosProductos(List<PedidosProductos> pedidosProductos) {
        this.pedidosProductos = pedidosProductos;
    }
}



