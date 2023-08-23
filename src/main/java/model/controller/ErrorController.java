package model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {

    @RequestMapping(path = "/error", method = RequestMethod.GET)
    public ModelAndView mostrarError() {
        ModelAndView modelAndView = new ModelAndView("error");

        return modelAndView;
    }
}