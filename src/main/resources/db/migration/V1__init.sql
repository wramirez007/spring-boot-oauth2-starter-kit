CREATE TABLE user (
  user_id INT(11) NOT NULL AUTO_INCREMENT,
	user_name CHAR(255) NOT NULL UNIQUE,
	user_pass CHAR(60) NOT NULL,
	user_first_name CHAR(255) NOT NULL,
	user_last_name CHAR(255) NOT NULL,
	user_email CHAR(255) NOT NULL,
  user_enabled BOOL NOT NULL,
	PRIMARY KEY (user_id)
);

CREATE TABLE role (
  role_id INT(11) NOT NULL AUTO_INCREMENT,
  role_name CHAR(255) NOT NULL UNIQUE,
  role_priority INT NOT NULL,
  PRIMARY KEY (role_id)
);

CREATE TABLE user_role (
  user_id INT(11) NOT NULL,
  role_id INT(11) NOT NULL,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (role_id) REFERENCES role(role_id)
);

insert into role (role_name, role_priority) values ('ROLE_GUEST', 0);
insert into role (role_name, role_priority) values ('ROLE_USER', 1);
insert into role (role_name, role_priority) values ('ROLE_ADMIN', 2);

-- username: user / password: password
insert into user (user_name, user_pass, user_first_name, user_last_name, user_email, user_enabled) values ('user', '$2a$08$NSZRZL/nPanphmka7vxenekVKGRTY4lf9An.C7kx9M2jWusFcrZO2', 'Normal User', 'User', 'user@user.com', true);
insert into user_role (user_id, role_id) values (
  (select user_id from user where user_name='user'),
  (select role_id from role where role_name='ROLE_USER'));

-- username: admin / password: password
insert into user (user_name, user_pass, user_first_name, user_last_name, user_email, user_enabled) values ('admin', '$2a$08$NSZRZL/nPanphmka7vxenekVKGRTY4lf9An.C7kx9M2jWusFcrZO2', 'Admin User', 'Admin', 'admin@admin.com', true);
insert into user_role (user_id, role_id) values (
  (select user_id from user where user_name='admin'),
  (select role_id from role where role_name='ROLE_ADMIN'));
