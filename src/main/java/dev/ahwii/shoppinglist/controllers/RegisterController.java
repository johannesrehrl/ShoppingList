package dev.ahwii.shoppinglist.controllers;

import dev.ahwii.shoppinglist.models.User;
import dev.ahwii.shoppinglist.models.UserRepository;
import dev.ahwii.shoppinglist.utils.Crypto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class RegisterController {

    @Autowired
    private UserRepository users;

    @RequestMapping("/register")
    public String index(Model model, @RequestParam(required = false) String username,
                        @RequestParam(required = false) String password) {

        if (username != null && password != null) {
            for (User u : users.findAll()) {
                if(u.getUsername().equals(username)) {
                    model.addAttribute("error", "Error: username already in use!");
                    return "register";
                }
            }

            User u = new User();

            u.setUsername(username);
            u.setPassword(Crypto.hashPassword(password));
            u.setCreate_time(new Date(System.currentTimeMillis()));
            u.setHousehold_id(0);

            users.save(u);
            return "home";
        }

        return "register";
    }

}
