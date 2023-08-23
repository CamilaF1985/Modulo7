package model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.entity.Cliente;
import model.entity.Usuario;
import model.service.ClienteService;
import model.service.UsuarioService;

@Controller
public class ClienteController {

    private final ClienteService clienteService;
    private final UsuarioService usuarioService; 

    @Autowired
    public ClienteController(ClienteService clienteService, UsuarioService usuarioService) {
        this.clienteService = clienteService;
        this.usuarioService = usuarioService; 
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
            @RequestParam("usuarioId") Long usuarioId) {
        
        // Obtener el usuario correspondiente al usuarioId
        Usuario usuario = usuarioService.getUsuarioById(usuarioId);
        
        if (usuario == null) {
            // Manejar el caso cuando no se encuentra el usuario
            return new ModelAndView("redirect:/"); // O redireccionar a una página de error
        }

        // Crear una nueva instancia de Cliente y asociarla con el Usuario
        Cliente cliente = new Cliente(nombres, apellidos, telefono, comuna, calle, numeracion, indicaciones, usuario);

        // Registrar el cliente en la base de datos
        clienteService.registrarCliente(cliente);

        // Redirigir a la página de inicio
        return new ModelAndView("redirect:/"); 
    }
}





