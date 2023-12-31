require("dotenv").config();
require("express-async-errors");
const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const notFoundMiddleware = require("./middleware/not-found");
const errorHandlerMiddleware = require("./middleware/errorHandler");
const cors = require("cors");
const connectDB = require("./db/connect");

const app = express();
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
//routes
app.use("/api/v1/auth", require("./routes/authentication"));
//error handlers
app.use(notFoundMiddleware);
app.use(errorHandlerMiddleware);
//server config
const port = process.env.PORT || 3000;
const start = async () => {
  try {
    await connectDB(process.env.MONGO_URI);
    app.listen(port, () => {
      console.log("Server is listening on port 3000...");
    });
  } catch (err) {
    console.log(err);
  }
};

start();
