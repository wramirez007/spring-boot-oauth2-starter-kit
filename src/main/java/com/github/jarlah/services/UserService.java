package com.github.jarlah.services;

import com.github.jarlah.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import rx.Observable;
import rx.schedulers.Schedulers;

@Service
public class UserService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Observable<User> findByUserName(String userName) {
        return Observable.create((Observable.OnSubscribe<User>) subscriber -> {
                subscriber.onStart();
                try {
                    subscriber.onNext(jdbcTemplate
                            .queryForObject("SELECT user_name, user_pass, user_first_name, user_last_name, user_email, user_enabled " +
                                            "FROM user WHERE user_name=?", new Object[]{userName},
                                    (rs, rowNum) -> {
                                        User u = new User();
                                        u.setUsername(rs.getString("user_name"));
                                        u.setPassword(rs.getString("user_pass"));
                                        u.setFirstname(rs.getString("user_first_name"));
                                        u.setLastname(rs.getString("user_last_name"));
                                        u.setEmail(rs.getString("user_email"));
                                        u.setEnabled(rs.getBoolean("user_enabled"));
                                        return u;
                                    }));
                    subscriber.onCompleted();
                } catch (Exception e) {
                    subscriber.onError(e);
                }
        }).subscribeOn(Schedulers.io());
    }
}
