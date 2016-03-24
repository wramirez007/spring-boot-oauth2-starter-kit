package com.github.jarlah.models;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    ROLE_ANY(0),
    ROLE_USER(1),
    ROLE_ADMIN(2),
    ROLE_SUPERADMIN(3);

    @Getter
    private final int priority;

    Role(int prio) {
        this.priority = prio;
    }

    @Override
    public String getAuthority() {
        return this.name();
    }
}
