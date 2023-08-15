package model.entity;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.*;

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
    
    @Column(name = "estado")
    private String estado;
    
    @Column(name = "fecha_ingreso")
    private LocalDateTime fechaIngreso;

    @Column(name = "fecha_despacho")
    private LocalDateTime fechaDespacho;
    
    @OneToOne
    @JoinColumn(name = "cliente_id")
    private Cliente cliente;
    
    @OneToMany(mappedBy = "pedido")
    private List<PedidosProductos> pedidosProductos;


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
    
    // Getter para Cliente
    public Cliente getCliente() {
        return cliente;
    }

    // Setter para Cliente
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    public List<PedidosProductos> getPedidosProductos() {
        return pedidosProductos;
    }

    public void setPedidosProductos(List<PedidosProductos> pedidosProductos) {
        this.pedidosProductos = pedidosProductos;
    }
    
}




