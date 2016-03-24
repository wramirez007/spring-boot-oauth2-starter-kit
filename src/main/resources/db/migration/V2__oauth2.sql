CREATE TABLE `ClientDetails` (
  `appId` varchar(256) NOT NULL,
  `resourceIds` varchar(256),
  `appSecret` varchar(256),
  `scope` varchar(256),
  `grantTypes` varchar(256),
  `redirectUrl` varchar(256),
  `authorities` varchar(256),
  `access_token_validity` int(11),
  `refresh_token_validity` int(11),
  `additionalInformation` longtext,
  `autoApproveScopes` varchar(256),
  PRIMARY KEY (`appId`)
);

CREATE TABLE `oauth_access_token` (
  `authentication_id` varchar(256) NOT NULL,
  `token_id` varchar(256),
  `token` text,
  `user_name` varchar(256),
  `client_id` varchar(256),
  `authentication` text,
  `refresh_token` text,
  PRIMARY KEY (`authentication_id`)
);

CREATE TABLE `oauth_approvals` (
  `userId` varchar(256),
  `clientId` varchar(256),
  `scope` varchar(256),
  `status` char(10),
  `expiresAt` timestamp,
  `lastModifiedAt` timestamp
);

CREATE TABLE `oauth_client_details` (
  `client_id` varchar(256) NOT NULL,
  `resource_ids` varchar(256),
  `client_secret` varchar(256),
  `scope` varchar(256),
  `authorized_grant_types` varchar(256),
  `web_server_redirect_uri` varchar(256),
  `authorities` varchar(256),
  `access_token_validity` int(11),
  `refresh_token_validity` int(11),
  `additional_information` longtext,
  `autoapprove` varchar(256),
  PRIMARY KEY (`client_id`)
);

CREATE TABLE `oauth_client_token` (
  `authentication_id` varchar(256) NOT NULL,
  `token_id` varchar(256),
  `token` varchar(256),
  `user_name` varchar(256),
  `client_id` varchar(256),
  PRIMARY KEY (`authentication_id`)
);

CREATE TABLE `oauth_code` (
  `code` varchar(256),
  `authentication` varchar(256)
);

CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256),
  `token` text,
  `authentication` text
);

INSERT INTO oauth_client_details VALUES('clientapp', NULL, '123456', 'read,write,delete', 'password,authorization_code,refresh_token,implicit', NULL, 'ROLE_USER, ROLE_ADMIN', NULL, NULL, NULL, NULL);