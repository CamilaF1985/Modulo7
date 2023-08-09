package model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import model.service.PedidoService;

@Controller
@RequestMapping("/crearpedido")
public class PedidoController {

    private final PedidoService pedidoService;

    @Autowired
    public PedidoController(PedidoService pedidoService) {
        this.pedidoService = pedidoService;
    }

    @GetMapping
    public ModelAndView mostrarFormularioCreacionPedido() {
        ModelAndView modelAndView = new ModelAndView("pedido");
        // Aquí puedes agregar lógica para obtener información necesaria para el formulario
        return modelAndView;
    }

    @PostMapping
    public ModelAndView crearPedido(
            @RequestParam Integer clienteId,
            @RequestParam Integer productoId,
            @RequestParam Integer cantidad,
            @RequestParam String indicaciones) {
        pedidoService.crearPedido(clienteId, productoId, cantidad, indicaciones);
        // Aquí puedes agregar lógica para redireccionar o mostrar mensajes al usuario
        return new ModelAndView("redirect:/"); // Redirige a la página de inicio
    }
}


