## Configure Passport in Express

### Dependencies

To use PassportJS in Express we will need these packages:

~~~
npm i -S passport passport-http passport-jwt jsonwebtoken bcrypt
~~~

If you want to make prettier logs (with colours)
~~~
npm i --save-dev chalck
~~~

### Configuration

1. Add the following variables to your .env file:

~~~
AUTH_ADMIN_USERNAME= //admin
AUTH_ADMIN_PASSWORD= //1234
AUTH_ADMIN_EMAIL= //micorreo@algo.com
AUTH_JWT_SECRET= //fjdirleldiofifjogei (256 bits recommended)
~~~

ADMIN_* corresponds to the user in the database.

2. In the folder `utils/auth/strategies/` create the following file: `basic.js` with the content:

~~~
const passport = require("passport");
const { BasicStrategy } = require("passport-http");
const boom = require("boom");
const bcrypt = require("bcrypt");
const MongoLib = require("../../../lib/mongo");

passport.use(
  new BasicStrategy(async function(username, password, cb) {
    const mongoDB = new MongoLib();

    try {
      const [user] = await mongoDB.getAll("users", { username });

      if (!user) {
        return cb(boom.unauthorized(), false);
      }

      if (!(await bcrypt.compare(password, user.password))) {
        return cb(boom.unauthorized(), false);
      }

      return cb(null, user);
    } catch (error) {
      return cb(error);
    }
  })
);
~~~

3. Add an endpoint to obtain tokens: `/token`:

~~~
const express = require("express");
const passport = require("passport");
const boom = require("boom");
const jwt = require("jsonwebtoken");
const api = express.Router();

const { config } = require("../../config");

// Basic strategy
require("../../utils/auth/strategies/basic");

api.post("/token", async function(req, res, next) {
  passport.authenticate("basic", function(error, user) {
    try {
      if (error || !user) {
        next(boom.unauthorized());
      }

      req.login(user, { session: false }, async function(error) {
        if (error) {
          next(error);
        }

        const payload = { sub: user.username, email: user.email };
        const token = jwt.sign(payload, config.authJwtSecret, {
          expiresIn: "15m"
        });

        return res.status(200).json({ access_token: token });
      });
    } catch (error) {
      next(error);
    }
  })(req, res, next);
});

module.exports = api;
~~~

4. Add jwt strategy: `/utils/auth/strategies/jwt.js`

~~~
const passport = require("passport");
const { Strategy, ExtractJwt } = require("passport-jwt");
const boom = require("boom");
const { config } = require("../../../config");
const MongoLib = require("../../../lib/mongo");

passport.use(
  new Strategy(
    {
      secretOrKey: config.authJwtSecret,
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken()
    },
    async function(tokenPayload, cb) {
      const mongoDB = new MongoLib();

      try {
        const [user] = await mongoDB.getAll("users", {
          username: tokenPayload.sub
        });

        if (!user) {
          return cb(boom.unauthorized(), false);
        }

        return cb(null, user);
      } catch (error) {
        return cb(error);
      }
    }
  )
);
~~~

Now you only have to require this file in your routes and add the next function `passport.authenticate("jwt")` as middleware.
