package model.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Cliente;
import model.entity.Pedido;
import model.entity.PedidosProductos;
import model.entity.Producto;
import model.repository.IClienteRepository;
import model.repository.IPedidoRepository;
import model.repository.IPedidosProductosRepository;
import model.repository.IProductoRepository;

@Service
public class PedidoService {

	private final IPedidoRepository pedidoRepository;
	private final IProductoRepository productoRepository;
	private final IClienteRepository clienteRepository;
	private final IPedidosProductosRepository pedidosProductosRepository;

	@Autowired
	public PedidoService(IPedidoRepository pedidoRepository, IProductoRepository productoRepository,
			IClienteRepository clienteRepository, IPedidosProductosRepository pedidosProductosRepository) {
		this.pedidoRepository = pedidoRepository;
		this.productoRepository = productoRepository;
		this.clienteRepository = clienteRepository;
		this.pedidosProductosRepository = pedidosProductosRepository;
	}

	// Crea un nuevo pedido en la base de datos
	public void crearPedido(Long clienteId, List<Integer> productoIds, Map<String, String> cantidadesMap,
			String indicaciones, String estado) {
		Cliente cliente = clienteRepository.findById(clienteId)
				.orElseThrow(() -> new RuntimeException("Cliente no encontrado"));

		Pedido pedido = new Pedido();
		pedido.setFechaIngreso(LocalDateTime.now());
		pedido.setFechaDespacho(null);
		pedido.setIndicaciones(indicaciones);
		pedido.setCliente(cliente);
		pedido.setEstado("Pendiente");
		pedidoRepository.save(pedido);

		for (Integer productoId : productoIds) {
			Producto producto = productoRepository.findById(productoId)
					.orElseThrow(() -> new RuntimeException("Producto no encontrado"));

			String cantidadStr = cantidadesMap.getOrDefault("cantidades[" + productoId + "]", "0");
			int cantidad = Integer.parseInt(cantidadStr);

			PedidosProductos pedidosProductos = new PedidosProductos(pedido, producto, cantidad);
			pedidosProductosRepository.save(pedidosProductos);
		}

		// Calcula y actualiza el precio total del pedido
		int precioTotal = pedidosProductosRepository.sumPrecioTotalByPedido(pedido);
		pedido.setPrecioTotal(precioTotal);
		pedidoRepository.save(pedido);
	}

	// Obtiene un pedido por su ID
	public Pedido obtenerPedidoPorId(Long Id) {
		return pedidoRepository.getOne(Id);
	}

	// Obtiene todos los pedidos
	public List<Pedido> obtenerTodosLosPedidos() {
		return pedidoRepository.findAll();
	}

	// Actualiza el estado de un pedido
	@Transactional
	public void actualizarPedido(Long Id, String nuevoEstado) {
		Pedido pedido = pedidoRepository.findById(Id).orElse(null);

		if (pedido != null) {
			pedido.setEstado(nuevoEstado);
		} else {
			throw new EntityNotFoundException("Pedido no encontrado con el ID proporcionado");
		}
	}

	// Actualiza la fecha de despacho de un pedido
	@Transactional
	public void actualizarFechaDespacho(Long Id) {
		Pedido pedido = pedidoRepository.findById(Id).orElse(null);

		if (pedido != null) {
			pedido.setFechaDespacho(LocalDateTime.now()); // Establecer la fecha y hora actual como fecha de despacho
		} else {
			throw new EntityNotFoundException("Pedido no encontrado con el ID proporcionado");
		}
	}

	// Obtiene todos los pedidos con información detallada de los productos
	@Transactional
	public List<Pedido> obtenerPedidosConProductos() {
		return pedidoRepository.findAllWithProductos();
	}

	// Obtiene pedidos entre dos fechas específicas
	public List<Pedido> obtenerPedidosEntreFechas(LocalDateTime startDateTime, LocalDateTime endDateTime) {
		return pedidoRepository.findByFechaIngresoBetween(startDateTime, endDateTime);
	}

	// Obtiene pedidos despachados
	public List<Pedido> obtenerPedidosDespachados() {
		return pedidoRepository.findByFechaDespachoNotNull();
	}

	// Obtiene pedidos no despachados
	public List<Pedido> obtenerPedidosNoDespachados() {
		return pedidoRepository.findByFechaDespachoIsNull();
	}
}
