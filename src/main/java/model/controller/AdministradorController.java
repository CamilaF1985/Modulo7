package model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.entity.Administrador;
import model.service.AdministradorService;
import model.service.UsuarioService;

@Controller
public class AdministradorController {

    private final AdministradorService administradorService;

    @Autowired
    public AdministradorController(AdministradorService administradorService, UsuarioService usuarioService) {
        this.administradorService = administradorService;
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
            @RequestParam("usuarioId") Long usuarioId) { // Obtén el usuarioId desde la URL
        try {
            // Crear una nueva instancia de Administrador y setear sus atributos con el ID del usuario
            Administrador administrador = new Administrador(rut, nombres, apellidos, fechaIngreso, usuarioId);

            // Registrar el administrador en la base de datos
            administradorService.registrarAdministrador(administrador);

            // Redirigir a una página de éxito o a otra página según el caso
            return new ModelAndView("redirect:/");
        } catch (Exception e) {
            e.printStackTrace();
            // Manejar el error adecuadamente
            return new ModelAndView("redirect:/");
        }
    }
}
