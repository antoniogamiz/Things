
### Dependencies

- `supertest` => mock server to make request to the endpoints
- `mocha` => asserts
- `sinon` => stats y mocks
- `proxyquire` => to add mocks to the requests.

Run the following command to install them:

`npm i -D supertest mocha sinon proxyquire`

Add the following script to your `package.json`:

`"test": "mocha --exit"`

By default, `mocha` will look for a directory called `test` where we will implement our tests.


### Important changes

To be able to test our API, we have to use Inversion of Control in our routes, so we will have to change our routes files to:

~~~
// old requires 

function routeAPI(app) {
  const router = express.Router();
  app.use("/api/iote", router);
  
  // old logic 
}

module.exports = routeAPI;
~~~

Using this we will be able to specify wich server use when running our tests.


### Supertest

Add the following file to `/utils/testServer.js`:

~~~
const express = require("express");
const supertest = require("supertest");

function testServer(route) {
  const app = express();
  route(app);
  return supertest(ApplicationCache);
}

module.exports = testServer;
~~~
