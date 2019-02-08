## Configuring a MongoDB instance.

1. Add an admin user:

~~~
db.createUser(
  {
    user: "useradmin",
    pwd: "thepianohasbeendrinking",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
  }
)
~~~
