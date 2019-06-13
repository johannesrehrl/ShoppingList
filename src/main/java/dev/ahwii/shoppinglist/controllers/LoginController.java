package dev.ahwii.shoppinglist.controllers;

import dev.ahwii.shoppinglist.models.User;
import dev.ahwii.shoppinglist.models.UserRepository;
import dev.ahwii.shoppinglist.utils.Crypto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @Autowired
    private UserRepository users;

    @RequestMapping("/")
    public String login(Model model, @RequestParam(required = false) String username,
                        @RequestParam(required = false) String password) {

        if (username != null && password != null) {
            for (User u : users.findAll()) {
                if(u.getUsername().equals(username) &&
                        u.getPassword().equalsIgnoreCase(Crypto.hashPassword(password))) {
                    return "redirect:/index";
                }
            }

            model.addAttribute("error", "Error: username or password wrong!");
        }

        return "login";
    }

}
