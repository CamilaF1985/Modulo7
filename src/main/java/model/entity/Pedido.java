package model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Pedido {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    private Cliente cliente;

    @ManyToOne
    private Producto producto;

    @Column(nullable = false)
    private Integer cantidad;

    @Column(length = 70)
    private String indicaciones;

    @Column(nullable = false)
    private Integer precioTotal;

    public Pedido() {
        // Constructor nulo requerido por JPA
    }

    public Pedido(Cliente cliente, Producto producto, Integer cantidad, String indicaciones, Integer precioTotal) {
        this.cliente = cliente;
        this.producto = producto;
        this.cantidad = cantidad;
        this.indicaciones = indicaciones;
        this.precioTotal = precioTotal;
    }

    // Getters y setters
    // ...

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public String getIndicaciones() {
        return indicaciones;
    }

    public void setIndicaciones(String indicaciones) {
        this.indicaciones = indicaciones;
    }

    public Integer getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(Integer precioTotal) {
        this.precioTotal = precioTotal;
    }
}

