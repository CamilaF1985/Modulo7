package model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.service.ClienteService;
import model.service.PedidoService;
import model.service.ProductoService;
import model.entity.Cliente;
import model.entity.Pedido;
import model.entity.Producto;

@Controller
public class PedidoController {
	@Autowired
	private PedidoService pedidoService;

	@Autowired
	private ClienteService clienteService;

	@Autowired
	private ProductoService productoService;
	
	@GetMapping("/verPedidos")
	public String verPedidos(Model model) {
	    List<Pedido> pedidos = pedidoService.obtenerTodosLosPedidos();
	    model.addAttribute("pedidos", pedidos);
	    return "verPedidos";
	}


	@GetMapping("/crearPedido")
	public String mostrarFormularioCreacion(Model model) {
		List<Cliente> clientes = clienteService.getClientes();
		List<Producto> productos = productoService.getProductos();

		model.addAttribute("clientes", clientes);
		model.addAttribute("productos", productos); // Agregar la lista de productos al modelo

		return "crearPedido";
	}

	@PostMapping("/crearPedido")
	public String crearPedido(@RequestParam Long clienteId, @RequestParam int productoId,
			@RequestParam Integer cantidad, @RequestParam String indicaciones) {

		Producto producto = productoService.getproductoById(productoId);
		if (producto == null) {
			throw new RuntimeException("Producto no encontrado");
		}

		pedidoService.crearPedido(clienteId, productoId, cantidad, indicaciones);

		return "redirect:/";
	}
}
