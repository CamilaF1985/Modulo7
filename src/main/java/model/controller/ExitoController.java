package model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExitoController {

    @RequestMapping(path = "/exito", method = RequestMethod.GET)
    public ModelAndView mostrarExito() {
        ModelAndView modelAndView = new ModelAndView("exito");
        // Puedes agregar objetos al modelo si necesitas pasar datos a la vista
        // modelAndView.addObject("mensajeExito", "Mensaje de éxito");
        return modelAndView;
    }
}
