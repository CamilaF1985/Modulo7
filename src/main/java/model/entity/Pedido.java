package model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "pedidos")
public class Pedido {

	@Id
	@Column(name = "id")
	private int idPedido;
	@Column(name = "cliente_id")
	private int clienteId;
	@Column(name = "producto_id")
	private int productoId;
	@Column(name = "cantidad")
	private int cantidad;
	@Column(name = "indicaciones")
	private String indicaciones;
	@Column(name = "precio_total")
	private int precioTotal;

    // Getters y setters
    // ...

	public int getIdPedido() {
		return idPedido;
	}

	public int getClienteId() {
		return clienteId;
	}

	public int getProductoId() {
		return productoId;
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
    
	public boolean setIdPedido(int idPedido) {
		if (idPedido > 0) {
			this.idPedido = idPedido;
			return true;
		} else {
			return false;
		}
	}

	public boolean setClienteId(int clienteId) {
		if (clienteId > 0) {
			this.clienteId = clienteId;
			return true;
		} else {
			return false;
		}
	}

	public boolean setProductoId(int productoId) {
		if (productoId > 0) {
			this.productoId = productoId;
			return true;
		} else {
			return false;
		}
	}
}

