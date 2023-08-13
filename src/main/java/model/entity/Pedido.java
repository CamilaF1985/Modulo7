package model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "pedidos")
public class Pedido {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "cliente_id")
    private Long clienteId;

    @Column(name = "cliente_nombres")
    private String clienteNombres;

    @Column(name = "cliente_apellidos")
    private String clienteApellidos;

    @Column(name = "cliente_telefono")
    private Long clienteTelefono;

    @Column(name = "cliente_comuna")
    private String clienteComuna;

    @Column(name = "cliente_calle")
    private String clienteCalle;

    @Column(name = "cliente_numeracion")
    private Integer clienteNumeracion;

    @Column(name = "cliente_indicaciones")
    private String clienteIndicaciones;

    @Column(name = "producto_id") // Nuevo campo para almacenar el ID del producto
    private Long productoId;

    @Column(name = "producto_nombre")
    private String productoNombre;

    @Column(name = "indicaciones")
    private String indicaciones;

    @Column(name = "precio_total")
    private Integer precioTotal;

    @Column(name = "cantidad") // Nuevo campo para almacenar la cantidad del producto
    private Integer cantidad;
    
    @Column(name = "estado")
    private String estado;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public Long getClienteId() {
        return clienteId;
    }

    public void setClienteId(Long clienteId) {
        this.clienteId = clienteId;
    }

    public String getClienteNombres() {
        return clienteNombres;
    }

    public void setClienteNombres(String clienteNombres) {
        this.clienteNombres = clienteNombres;
    }

    public String getClienteApellidos() {
        return clienteApellidos;
    }

    public void setClienteApellidos(String clienteApellidos) {
        this.clienteApellidos = clienteApellidos;
    }

    public Long getClienteTelefono() {
        return clienteTelefono;
    }

    public void setClienteTelefono(Long clienteTelefono) {
        this.clienteTelefono = clienteTelefono;
    }

    public String getClienteComuna() {
        return clienteComuna;
    }

    public void setClienteComuna(String clienteComuna) {
        this.clienteComuna = clienteComuna;
    }

    public String getClienteCalle() {
        return clienteCalle;
    }

    public void setClienteCalle(String clienteCalle) {
        this.clienteCalle = clienteCalle;
    }

    public Integer getClienteNumeracion() {
        return clienteNumeracion;
    }

    public void setClienteNumeracion(Integer clienteNumeracion) {
        this.clienteNumeracion = clienteNumeracion;
    }

    public String getClienteIndicaciones() {
        return clienteIndicaciones;
    }

    public void setClienteIndicaciones(String clienteIndicaciones) {
        this.clienteIndicaciones = clienteIndicaciones;
    }

    public Long getProductoId() {
        return productoId;
    }

    public void setProductoId(Long productoId) {
        this.productoId = productoId;
    }

    public String getProductoNombre() {
        return productoNombre;
    }

    public void setProductoNombre(String productoNombre) {
        this.productoNombre = productoNombre;
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
}




