package model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.entity.Administrador;
import model.entity.Usuario;
import model.service.AdministradorService;
import model.service.UsuarioService;

@Controller
public class AdministradorController {

    private final AdministradorService administradorService;
    private final UsuarioService usuarioService;

    @Autowired
    public AdministradorController(AdministradorService administradorService, UsuarioService usuarioService) {
        this.administradorService = administradorService;
        this.usuarioService = usuarioService;
    }
    
    @GetMapping("/registroAdministrador")
    public ModelAndView mostrarRegistroAdministrador(@RequestParam("usuarioId") Long usuarioId) {
        ModelAndView modelAndView = new ModelAndView("registroAdministrador");
        modelAndView.addObject("usuarioId", usuarioId);
        return modelAndView;
    }
   
    @PostMapping("/registroAdministrador")
    public ModelAndView registrarAdministrador(
            @RequestParam("rut") Long rut,
            @RequestParam("nombres") String nombres,
            @RequestParam("apellidos") String apellidos,
            @RequestParam("fechaIngreso") String fechaIngreso,
            @RequestParam("usuarioId") Long usuarioId) {

        // Obtener el usuario correspondiente al usuarioId
        Usuario usuario = usuarioService.getUsuarioById(usuarioId);

        if (usuario == null) {
            // Manejar el caso cuando no se encuentra el usuario
            return new ModelAndView("redirect:/"); // O redireccionar a una página de error
        }

        // Crear una nueva instancia de Administrador y asociarla con el Usuario
        Administrador administrador = new Administrador(rut, nombres, apellidos, fechaIngreso, usuario);

        // Registrar el administrador en la base de datos
        administradorService.registrarAdministrador(administrador);

        // Redirigir a la página de inicio
        return new ModelAndView("redirect:/"); 
    }

}

