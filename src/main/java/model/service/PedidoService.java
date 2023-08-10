package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Pedido;
import model.repository.IPedidoRepository;

@Service
public class PedidoService {
	@Autowired
    private IPedidoRepository pedRepo;
	
	public PedidoService() {
        super();
    }
	
	public List<Pedido> obtenerTodosLosPedidos() {
        return pedRepo.findAll();
    }

	public void crearPedido(int clienteId, int productoId, int cantidad, String indicaciones, int precioTotal) {
        Pedido pedido = new Pedido();
        pedido.setClienteId(clienteId);
        pedido.setProductoId(productoId);
        pedido.setCantidad(cantidad);
        pedido.setIndicaciones(indicaciones);
        pedido.setPrecioTotal(precioTotal);
        
        pedRepo.save(pedido);
    }

	public Pedido obtenerPedidoPorId(int pedidoId) {
		return pedRepo.getOne(pedidoId);
	}

	public void guardarPedido(Pedido pedido) {
		pedRepo.save(pedido);
	}
	
	//Borrar
	public void actualizarPedido(Pedido pedido) {
        // Verificar si el pedido existe en la base de datos
        if (pedRepo.existsById(pedido.getIdPedido())) {
            // Actualizar el pedido en la base de datos
        	pedRepo.save(pedido);
        } else {
            // El pedido no existe, realizar alguna acción o lanzar una excepción
            throw new RuntimeException("El pedido con ID " + pedido.getIdPedido() + " no existe.");
        }
    }
}

