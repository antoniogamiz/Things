## Configuring a MongoDB instance (from docker).

1. Modify the default admin user:

~~~
$ mongo -u admin -p admin --authenticationDatabase
use admin
db.changeUserPassword("admin","newpassword")
~~~

2. Add this to the mongod.conf file (by default in /etc/mongod.conf):

~~~
security:
    authorization: "enabled"
~~~

3. Restart mongod.

4. Init a shell with mongo and authenticate as admin:
~~~
$ mongo
use admin
db.auth("admin","newpassword")
~~~

5. Create a new database and a collection:

~~~
use somedb
db.createCollection("name")
db.insert({random: "random"}) // Necessary, otherwise <somedb> will not be saved in the system
db.createUser({
  user: "<name>",
  pwd: "<cleartext password>",
  roles: [
    { role: "readWrite", db: "oauth" }
  ]}
)

db.dropUser("<username>") 
~~~
