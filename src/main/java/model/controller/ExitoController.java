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

        return modelAndView;
    }
}
