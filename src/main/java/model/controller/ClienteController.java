package model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
    public ModelAndView registrarCliente(
            @RequestParam("nombres") String nombres,
            @RequestParam("apellidos") String apellidos,
            @RequestParam("telefono") Long telefono,
            @RequestParam("comuna") String comuna,
            @RequestParam("calle") String calle,
            @RequestParam("numeracion") Integer numeracion,
            @RequestParam("indicaciones") String indicaciones) {
        
        try {
            Cliente cliente = new Cliente();
            cliente.setNombres(nombres);
            cliente.setApellidos(apellidos);
            cliente.setTelefono(telefono);
            cliente.setComuna(comuna);
            cliente.setCalle(calle);
            cliente.setNumeracion(numeracion);
            cliente.setIndicaciones(indicaciones);

            clienteService.registrarCliente(cliente);

            // Redirigir a una página de éxito o a otra página según el caso
            return new ModelAndView("redirect:/");
        } catch (Exception e) {
            e.printStackTrace();
            // Manejar el error adecuadamente, redirigir a una página de error o mostrar un mensaje de error en la vista.
            return new ModelAndView("redirect:/");
        }
    }
}




