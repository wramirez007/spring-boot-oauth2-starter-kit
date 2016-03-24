package com.github.jarlah.controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
public class HomeController {

    @PreAuthorize("hasRole('USER')")
    @RequestMapping("/user")
    public Principal user(Principal user) {
        return user;
    }
}
