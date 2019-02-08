## Configuring a MongoDB instance (from docker).

1. Modify the default admin user:

~~~
$ mongo -u admin -p admin --authenticationDatabase
use admin
db.changeUserPassword("admin","newpassword");
~~~
