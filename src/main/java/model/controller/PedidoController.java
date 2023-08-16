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
    

    @GetMapping("/verPedidos")
    public String verPedidos(Model model) {
        List<Pedido> pedidos = pedidoService.obtenerPedidosConProductos();
        model.addAttribute("pedidos", pedidos);
        return "verPedidos";
    }
    
    @PostMapping("/actualizarEstadoPedido")
    public String actualizarEstadoPedido(@RequestParam Long Id, @RequestParam String nuevoEstado) {
        pedidoService.actualizarPedido(Id, nuevoEstado);
        
        if ("Despachado".equals(nuevoEstado)) {
            pedidoService.actualizarFechaDespacho(Id);
        }
        
        return "redirect:/verPedidos";
    }

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

    @PostMapping("/crearPedido")
    public String crearPedido(@RequestParam Long clienteId, @RequestParam List<Integer> productoIds,
                              @RequestParam List<Integer> cantidades, @RequestParam String indicaciones) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName(); // Obtener el nombre de usuario

        Cliente cliente = clienteService.getClienteByUserName(username);
        if (cliente == null) {
            throw new RuntimeException("Cliente no encontrado");
        }

        pedidoService.crearPedido(clienteId, productoIds, cantidades, indicaciones);

        return "redirect:/exito"; // Redirigir a la vista de éxito
    }

    
    @GetMapping("/pedidosDespachados")
    public String verPedidosDespachados(Model model) {
        List<Pedido> pedidosDespachados = pedidoService.obtenerPedidosDespachados();
        model.addAttribute("pedidos", pedidosDespachados);
        return "verPedidos";
    }

    @GetMapping("/pedidosNoDespachados")
    public String verPedidosNoDespachados(Model model) {
        List<Pedido> pedidosNoDespachados = pedidoService.obtenerPedidosNoDespachados();
        model.addAttribute("pedidos", pedidosNoDespachados);
        return "verPedidos";
    }

}






