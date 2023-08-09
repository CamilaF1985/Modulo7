package model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import model.entity.Cliente;
import model.entity.Pedido;
import model.entity.Producto;
import model.repository.IPedidoRepository;

@Service
public class PedidoService {

    private final IPedidoRepository pedidoRepository;
    private final ClienteService clienteService;
    private final ProductoService productoService;

    @Autowired
    public PedidoService(IPedidoRepository pedidoRepository, ClienteService clienteService, ProductoService productoService) {
        this.pedidoRepository = pedidoRepository;
        this.clienteService = clienteService;
        this.productoService = productoService;
    }

    public Pedido crearPedido(Integer clienteId, Integer productoId, Integer cantidad, String indicaciones) {
        Cliente cliente = clienteService.obtenerClientePorId(clienteId);
        Producto producto = productoService.obtenerProductoPorId(productoId);
        
        if (cliente != null && producto != null) {
            int precioTotal = producto.getPrecio() * cantidad;

            Pedido pedido = new Pedido();
            pedido.setCliente(cliente);
            pedido.setProducto(producto);
            pedido.setCantidad(cantidad);
            pedido.setIndicaciones(indicaciones);
            pedido.setPrecioTotal(precioTotal);

            return pedidoRepository.save(pedido);
        }
        
        return null; // Cliente o producto no encontrados
    }
}

