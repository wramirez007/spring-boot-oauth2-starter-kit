package com.github.jarlah.config;

import com.github.jarlah.services.RoleService;
import com.github.jarlah.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import rx.Observable;

@Service
public class CustomUserDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {
    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Override
    public UserDetails loadUserByUsername(String username) {
        return Observable.zip(userService.findByUserName(username), roleService.findByUserName(username), (user, roles) -> {
            user.setRoles(roles);
            return user;
        }).toBlocking().first();
    }
}
