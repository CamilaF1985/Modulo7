package model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

import model.service.PedidoService;
import model.service.ProductoService;
import model.service.ClienteService; // Agregar la importación del servicio de cliente
import model.entity.Cliente;
import model.entity.Pedido;
import model.entity.Producto;

@Controller
public class PedidoController {

	@Autowired
	private PedidoService pedidoService;

	@Autowired
	private ProductoService productoService;

	@Autowired
	private ClienteService clienteService; // Inyectar el servicio de cliente

	/**
	 * Maneja la solicitud GET para ver la lista de pedidos con productos.
	 *
	 * @param model El modelo a usar en la vista.
	 * @return La vista "verPedidos".
	 */
	@GetMapping("/verPedidos")
	public String verPedidos(Model model) {
		List<Pedido> pedidos = pedidoService.obtenerPedidosConProductos();
		model.addAttribute("pedidos", pedidos);
		return "verPedidos";
	}

	/**
	 * Maneja la solicitud POST para actualizar el estado de un pedido.
	 *
	 * @param Id          El ID del pedido a actualizar.
	 * @param nuevoEstado El nuevo estado del pedido.
	 * @return Redirige a la vista "verPedidos".
	 */
	@PostMapping("/actualizarEstadoPedido")
	public String actualizarEstadoPedido(@RequestParam Long Id, @RequestParam String nuevoEstado) {
		pedidoService.actualizarPedido(Id, nuevoEstado);

		if ("Despachado".equals(nuevoEstado)) {
			pedidoService.actualizarFechaDespacho(Id);
		}

		return "redirect:/verPedidos";
	}

	/**
	 * Maneja la solicitud GET para mostrar el formulario de creación de pedido.
	 *
	 * @param model El modelo a usar en la vista.
	 * @return La vista "crearPedido".
	 */
	@GetMapping("/crearPedido")
	public String mostrarFormularioCreacion(Model model) {
		List<Producto> productos = productoService.getProductos();
		model.addAttribute("productos", productos); // Agregar la lista de productos al modelo

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();

		Cliente cliente = clienteService.getClienteByUserName(username);
		if (cliente != null) {
			model.addAttribute("cliente", cliente); // Agregar el cliente al modelo
		}

		return "crearPedido";
	}

	/**
	 * Maneja la solicitud POST para crear un nuevo pedido.
	 *
	 * @param clienteId     El ID del cliente asociado al pedido.
	 * @param productoIds   Los IDs de los productos en el pedido.
	 * @param cantidadesMap Mapa de cantidades de productos.
	 * @param indicaciones  Indicaciones especiales para el pedido.
	 * @param indicaciones  Estado del pedido.
	 * @return Redirige a la vista "exito".
	 */
	@PostMapping("/crearPedido")
	public String crearPedido(@RequestParam Long clienteId, @RequestParam List<Integer> productoIds,
			@RequestParam Map<String, String> cantidadesMap, @RequestParam String indicaciones, @RequestParam String estado) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();

		Cliente cliente = clienteService.getClienteByUserName(username);
		if (cliente == null) {
			throw new RuntimeException("Cliente no encontrado");
		}

		pedidoService.crearPedido(clienteId, productoIds, cantidadesMap, indicaciones, estado);

		return "redirect:/exito";
	}

	/**
	 * Maneja la solicitud GET para ver la lista de pedidos despachados.
	 *
	 * @param model El modelo a usar en la vista.
	 * @return La vista "verPedidos".
	 */
	@GetMapping("/pedidosDespachados")
	public String verPedidosDespachados(Model model) {
		List<Pedido> pedidosDespachados = pedidoService.obtenerPedidosDespachados();
		model.addAttribute("pedidos", pedidosDespachados);
		return "verPedidos";
	}

	/**
	 * Maneja la solicitud GET para ver la lista de pedidos no despachados.
	 *
	 * @param model El modelo a usar en la vista.
	 * @return La vista "verPedidos".
	 */
	@GetMapping("/pedidosNoDespachados")
	public String verPedidosNoDespachados(Model model) {
		List<Pedido> pedidosNoDespachados = pedidoService.obtenerPedidosNoDespachados();
		model.addAttribute("pedidos", pedidosNoDespachados);
		return "verPedidos";
	}
}
