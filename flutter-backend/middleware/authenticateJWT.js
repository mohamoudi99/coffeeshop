const jwt = require("jsonwebtoken");

const authenticateJWT = (req, res, next) => {
  const token = req.headers.authorization;

  if (!token) {
    return res.sendStatus(401);
  }

  // Split the token to get the actual token
  const splitToken = token.split(" ");
  if (splitToken.length !== 2) {
    return res.sendStatus(403);
  }

  const actualToken = splitToken[1];

  jwt.verify(actualToken, process.env.JWT_SECRET, (err, user) => {
    if (err) {
      return res.sendStatus(403);
    }

    // You might want to check if the user object is valid or contains required information

    req.user = user;
    next();
  });
};

module.exports = authenticateJWT;
