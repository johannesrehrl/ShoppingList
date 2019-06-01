package dev.ahwii.shoppinglist.controllers;

import dev.ahwii.shoppinglist.models.User;
import dev.ahwii.shoppinglist.models.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Index {

    @Autowired
    private UserRepository users;

    @RequestMapping("/")
    public String index(Model model) {
        model.addAttribute("users", users.findAll());

        User us = new User();
        us.setUsername("thomas-" + (int)(Math.random() * 9999));
        us.setPassword("" + (long)(Math.random() * Long.MAX_VALUE));
        users.save(us);

        return "index";
    }

}
