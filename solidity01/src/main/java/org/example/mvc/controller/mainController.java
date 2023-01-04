package org.example.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainController {
    @RequestMapping("")
    public String home(){
        return "redirect:/home";
    }

}
