package model.service;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Cliente;
import model.entity.Pedido;
import model.entity.Producto;
import model.repository.IClienteRepository;
import model.repository.IPedidoRepository;
import model.repository.IProductoRepository;

@Service
public class PedidoService {

    private final IPedidoRepository pedidoRepository;
    private final IProductoRepository productoRepository;
	private final IClienteRepository clienteRepository;

    @Autowired
    public PedidoService(IPedidoRepository pedidoRepository, IProductoRepository productoRepository, IClienteRepository clienteRepository) {
        this.pedidoRepository = pedidoRepository;
        this.productoRepository = productoRepository;
        this.clienteRepository = clienteRepository; // 
    }

    public void crearPedido(Long clienteId, Integer productoId, Integer cantidad, String indicaciones) {
        Producto producto = productoRepository.findById(productoId)
                .orElseThrow(() -> new RuntimeException("Producto no encontrado"));	
        Cliente cliente = clienteRepository.findById(clienteId)
                .orElseThrow(() -> new RuntimeException("Cliente no encontrado"));
        Pedido pedido = new Pedido();
        
        // Setear los campos de tiempo
        pedido.setFechaIngreso(LocalDateTime.now()); // Fecha y hora actual
        pedido.setFechaDespacho(null); // 
        pedido.setIndicaciones(indicaciones);
        pedido.setCantidad(cantidad);

        int precioTotal = producto.getPrecio() * cantidad;
        pedido.setPrecioTotal(precioTotal);

        pedido.setCliente(cliente); // Asignar el cliente al pedido
        pedido.setProducto(producto); // Asignar el producto al pedido

        pedidoRepository.save(pedido); // Guardar el Pedido
    }
    
	public Pedido obtenerPedidoPorId(Long Id) {
		return pedidoRepository.getOne(Id);
	}

    
    public List<Pedido> obtenerTodosLosPedidos() {
        return pedidoRepository.findAll();
    }
    

    @Transactional
    public void actualizarPedido(Long Id, String nuevoEstado) {
		Pedido pedido  = pedidoRepository.findById(Id).orElse(null);
        
        if (pedido != null) {
            pedido.setEstado(nuevoEstado);
        } else {
            throw new EntityNotFoundException("Pedido no encontrado con el ID proporcionado");
        }
    }
    
    @Transactional
    public void actualizarFechaDespacho(Long Id) {
        Pedido pedido = pedidoRepository.findById(Id).orElse(null);
        
        if (pedido != null) {
            pedido.setFechaDespacho(LocalDateTime.now()); // Establecer la fecha y hora actual como fecha de despacho
        } else {
            throw new EntityNotFoundException("Pedido no encontrado con el ID proporcionado");
        }
    }

    
    public List<Pedido> obtenerPedidosEntreFechas(LocalDateTime startDateTime, LocalDateTime endDateTime) {
        return pedidoRepository.findByFechaIngresoBetween(startDateTime, endDateTime);
    }

    public List<Pedido> obtenerPedidosDespachados() {
        return pedidoRepository.findByFechaDespachoNotNull();
    }

    public List<Pedido> obtenerPedidosNoDespachados() {
        return pedidoRepository.findByFechaDespachoIsNull();
    }
}





