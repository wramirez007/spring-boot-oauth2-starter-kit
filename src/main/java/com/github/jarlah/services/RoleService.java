package com.github.jarlah.services;

import com.github.jarlah.models.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import rx.Observable;
import rx.schedulers.Schedulers;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class RoleService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Observable<List<Role>> findByUserName(String username) {
        return rx.Observable.create((rx.Observable.OnSubscribe<List<Role>>) subscriber -> {
            subscriber.onStart();
            try {
                subscriber.onNext(jdbcTemplate
                        .queryForList("SELECT role_name " +
                                        "FROM user_role ur, role r, user u " +
                                        "WHERE ur.user_id=u.user_id AND ur.role_id=r.role_id AND u.user_name=?",
                                new Object[]{username}, String.class)
                        .stream()
                        .map(Role::valueOf)
                        .collect(Collectors.toList()));
                subscriber.onCompleted();
            } catch (Exception e) {
                subscriber.onError(e);
            }
        }).subscribeOn(Schedulers.io());
    }
}
