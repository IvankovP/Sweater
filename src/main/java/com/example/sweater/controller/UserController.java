package com.example.sweater.controller;

import com.example.sweater.domain.constant.Role;
import com.example.sweater.domain.dao.UserRepository;
import com.example.sweater.domain.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/users")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public String allUsers(Map<String, Object> model) {
        model.put("users", userRepository.findAll());
        return "users";
    }

    @GetMapping("{user}")
    public String userPage(@PathVariable User user, Map<String, Object> model) {
        model.put("user", user);
        model.put("roles", Role.values());
        return "userEdit";
    }

    @PostMapping()
    public String userSave(@RequestParam Map<String, String> form,
                           @RequestParam String username,
                           @RequestParam("userId") User user) {

        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values()).map(Role::name).collect(Collectors.toSet());
        user.getRoles().clear();

        form.keySet().forEach(role -> {
            if (roles.contains(role)) user.getRoles().add(Role.valueOf(role));
        });

        userRepository.save(user);

        return "redirect:/users";
    }
}
