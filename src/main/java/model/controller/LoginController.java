package model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.entity.Administrador;
import model.entity.Cliente;
import model.service.ClienteService;
import model.service.AdministradorService;

@Controller
public class LoginController {

    @Autowired
    private ClienteService clienteService; // Inyectar el servicio ClienteService
    @Autowired
    private AdministradorService administradorService; // Inyectar el servicio AdministradorService

    // Método para cargar la página de login
    @RequestMapping(value = "/login")
    public ModelAndView login() {
        return new ModelAndView("login");
    }

    // Método para cargar la página de error de login
    @RequestMapping(value = "/error")
    public ModelAndView errorLogin() {
        return new ModelAndView("login", "error", "true");
    }

    // Método para procesar el éxito de login
    @RequestMapping(value = "/login/success")
    public ModelAndView loginSuccess() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName(); // Obtener el nombre de usuario

        if (isCliente()) {
            Cliente cliente = clienteService.getClienteByUserName(username);
            if (cliente != null) {
            }
        } else if (isAdministrador()) {
            Administrador administrador = administradorService.getAdministradorByUserName(username);
            if (administrador != null) {
            }
        }

        return new ModelAndView("redirect:/");
    }

    // Método para verificar si el usuario tiene el rol "cliente"
    private boolean isCliente() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            return auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_CLIENTE"));
        }
        return false;
    }

    // Método para verificar si el usuario tiene el rol "administrador"
    private boolean isAdministrador() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            return auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMINISTRADOR"));
        }
        return false;
    }
}
























