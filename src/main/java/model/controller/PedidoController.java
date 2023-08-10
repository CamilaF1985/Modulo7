package model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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

	@GetMapping("/listarPedidos")
	public ModelAndView listarTodoslosPedidos() {
		List<Pedido> pedidos = pedidoService.obtenerTodosLosPedidos();

		ModelAndView modelAndView = new ModelAndView("listarPedidos");
		modelAndView.addObject("pedidos", pedidos);
		return modelAndView;
	}

	// Crear
	@GetMapping("/crearPedido")
	public String mostrarFormularioCreacion(Model model) {
		List<Cliente> clientes = clienteService.getClientes();
		List<Producto> productos = productoService.getProductos();

		model.addAttribute("producto", new Producto());
		model.addAttribute("clientes", clientes);
		model.addAttribute("productos", productos);

		return "crearPedido";
	}

	@PostMapping("/crearPedido")
	public String crearPedido(@RequestParam int clienteId, @RequestParam int productoId,
	        @RequestParam int cantidad, @RequestParam String indicaciones) {
	    Producto producto = productoService.getProductoById(productoId);
	    int precioTotal = producto.getPrecio() * cantidad; // Calcula el precio total

	    pedidoService.crearPedido(clienteId, productoId, cantidad, indicaciones, precioTotal);
	    return "redirect:/";
	}

}



