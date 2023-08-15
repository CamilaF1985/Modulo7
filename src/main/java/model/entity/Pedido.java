package model.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "pedidos")
public class Pedido {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "indicaciones")
    private String indicaciones;

    @Column(name = "precio_total")
    private Integer precioTotal;

    @Column(name = "cantidad") // Nuevo campo para almacenar la cantidad del producto
    private Integer cantidad;
    
    @Column(name = "estado")
    private String estado;
    
    @Column(name = "fecha_ingreso")
    private LocalDateTime fechaIngreso;

    @Column(name = "fecha_despacho")
    private LocalDateTime fechaDespacho;
    
    @OneToOne
    @JoinColumn(name = "producto_id")
    private Producto producto;
    
    @OneToOne
    @JoinColumn(name = "cliente_id")
    private Cliente cliente;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
        
    public String getIndicaciones() {
        return indicaciones;
    }

    public void setIndicaciones(String indicaciones) {
        this.indicaciones = indicaciones;
    }
    
    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }
    
    public Integer getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(Integer precioTotal) {
        this.precioTotal = precioTotal;
    }
    
    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    

    public LocalDateTime getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(LocalDateTime fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public LocalDateTime getFechaDespacho() {
        return fechaDespacho;
    }

    public void setFechaDespacho(LocalDateTime fechaDespacho) {
        this.fechaDespacho = fechaDespacho;
    }
    

    // Getter para Producto
    public Producto getProducto() {
        return producto;
    }

    // Setter para Producto
    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    // Getter para Cliente
    public Cliente getCliente() {
        return cliente;
    }

    // Setter para Cliente
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
}




