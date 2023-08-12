package model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.entity.Cliente;
import model.service.ClienteService;
import model.service.UsuarioService;

@Controller
public class ClienteController {

    private final ClienteService clienteService;

    @Autowired
    public ClienteController(ClienteService clienteService, UsuarioService usuarioService) {
        this.clienteService = clienteService;
    }
    
    @GetMapping("/registroCliente")
    public ModelAndView mostrarRegistroCliente(@RequestParam("usuarioId") Long usuarioId) {
        ModelAndView modelAndView = new ModelAndView("registroCliente");
        modelAndView.addObject("usuarioId", usuarioId);
        return modelAndView;
    }
   
    @PostMapping("/registroCliente")
    public ModelAndView registrarCliente(
            @RequestParam("nombres") String nombres,
            @RequestParam("apellidos") String apellidos,
            @RequestParam("telefono") Long telefono,
            @RequestParam("comuna") String comuna,
            @RequestParam("calle") String calle,
            @RequestParam("numeracion") Integer numeracion,
            @RequestParam("indicaciones") String indicaciones,
            @RequestParam("usuarioId") Long usuarioId) { // Obtén el usuarioId desde la URL
        try {
            // Crear una nueva instancia de Cliente y setear sus atributos con el ID del usuario
            Cliente cliente = new Cliente(nombres, apellidos, telefono, comuna, calle, numeracion, indicaciones, usuarioId);

            // Registrar el cliente en la base de datos
            clienteService.registrarCliente(cliente);

            // Redirigir a una página de éxito o a otra página según el caso
            return new ModelAndView("redirect:/");
        } catch (Exception e) {
            e.printStackTrace();
            // Manejar el error adecuadamente
            return new ModelAndView("redirect:/");
        }
    }
}





