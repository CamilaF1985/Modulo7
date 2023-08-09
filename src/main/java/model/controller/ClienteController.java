package model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.entity.Cliente;
import model.service.ClienteService;

@Controller
public class ClienteController {

    private final ClienteService clienteService;

    @Autowired
    public ClienteController(ClienteService clienteService) {
        this.clienteService = clienteService;
    }

    @RequestMapping(path = "/registroCliente", method = RequestMethod.GET)
    public ModelAndView mostrarRegistroCliente() {
        return new ModelAndView("registroCliente");
    }

    @RequestMapping(path = "/registroCliente", method = RequestMethod.POST)
    public ModelAndView registrarCliente(Cliente cliente) {
        try {
            clienteService.registrarCliente(cliente); // Llamar al método del servicio en lugar del DAO
            // Redirigir a una página de éxito o a otra página según el caso
            return new ModelAndView("redirect:/");
        } catch (Exception e) {
            e.printStackTrace();
            // Manejar el error adecuadamente, redirigir a una página de error o mostrar un mensaje de error en la vista.
            return new ModelAndView("redirect:/");
        }
    }
}




