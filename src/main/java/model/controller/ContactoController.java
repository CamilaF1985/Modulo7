package model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.entity.Contacto;
import model.service.ContactoService;

@Controller
public class ContactoController {

    private final ContactoService contactoService;

    @Autowired
    public ContactoController(ContactoService contactoService) {
        this.contactoService = contactoService;
    }

    @RequestMapping(path = "/contacto", method = RequestMethod.GET)
    public ModelAndView mostrarContacto() {
        return new ModelAndView("contacto");
    }

    @RequestMapping(path = "/contacto", method = RequestMethod.POST)
    public ModelAndView registrarContacto(Contacto contacto) {
        try {
            contactoService.crearContacto(contacto); // Llamar al método del servicio 
            // Redirigir a una página de éxito o a otra página según el caso
            return new ModelAndView("redirect:/");
        } catch (Exception e) {
            e.printStackTrace();
            // Manejar el error adecuadamente, redirigir a una página de error o mostrar un mensaje de error en la vista.
            return new ModelAndView("redirect:/");
        }
    }
}








