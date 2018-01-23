require("../../config.js");
const path = require("path");
const express = require("express");
const bodyParser = require("body-parser");
const api_router = require("./routers/api_router");
const util = require("util");

const app = express();

app.use(express.static(path.join(__dirname, "../../public")));
app.use(bodyParser.json());
app.use(express.static("public"));

// API Router
app.use("/api/v1/", api_router);

// 404 route
app.use((req, res, next) => {
  res.status(404).send("404 Page Not Found");
});

// Validation Error Handler
app.use((err, req, res, next) => {
  if (err.message === "validation error") {
    return res.status(400).json(err);
  }
  return next();
});

// Generic Error Handler
app.use((err, req, res, next) => {
  console.log(
    "Server Error: ",
    util.inspect(err, { showHidden: false, depth: null })
  );
  return res.status(500).send("500 Internal Server Error");
});

module.exports = app;
