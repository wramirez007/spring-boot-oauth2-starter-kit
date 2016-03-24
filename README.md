# Spring Boot OAuth2 Starter Kit

Run the project with

```
  mvn spring-boot:run
```

To login, get authentication token with (effectively logging in as user "user"):

```
  curl -X POST -vu clientapp:123456 http://localhost:8080/oauth/token -H "Accept: application/json" -d "password=password&username=user&grant_type=password&scope=read%20write&client_secrret=123456&client_id=clientapp"
```

Take authentication token from the previous response and put it into Authorization header:

Call secured endpoint (any endpoint really):

```
  curl -H "Authorization: Bearer <token>" http://localhost:8080/user
```
