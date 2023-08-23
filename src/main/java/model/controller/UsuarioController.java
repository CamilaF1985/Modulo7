package model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.entity.Usuario;
import model.service.UsuarioService;

@Controller
public class UsuarioController {

    private final UsuarioService usuarioService;

    @Autowired
    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @RequestMapping(path = "/registroUsuario", method = RequestMethod.GET)
    public ModelAndView mostrarRegistroUsuario() {
        return new ModelAndView("registroUsuario");
    }

    @RequestMapping(path = "/registroUsuario", method = RequestMethod.POST)
    public ModelAndView registrarUsuario(
            @RequestParam("user") String user,
            @RequestParam("password") String password,
            @RequestParam("email") String email,
            @RequestParam("rol") String rol,
            @RequestParam("tipo") String tipo) {

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encryptedPassword = passwordEncoder.encode(password);

        Usuario usuario = new Usuario();
        usuario.setUser(user);
        usuario.setPassword(encryptedPassword);
        usuario.setEmail(email);
        usuario.setRol(rol);
        usuario.setTipo(tipo);

        Usuario usuarioRegistrado = usuarioService.registrarUsuario(usuario);

        if ("Cliente".equals(tipo)) {
            // Redirigir al controlador de Cliente y pasar el ID del usuario registrado como parámetro
            return new ModelAndView("redirect:/registroCliente?usuarioId=" + usuarioRegistrado.getId());
        } else if ("Administrador".equals(tipo)) {
            // Redirigir al controlador de Administrador y pasar el ID del usuario registrado como parámetro
            return new ModelAndView("redirect:/registroAdministrador?usuarioId=" + usuarioRegistrado.getId());
        }

        return null;
    }
}


