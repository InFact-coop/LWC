require("../../config.js");
const path = require("path");
const express = require("express");
const bodyParser = require("body-parser");
const api_router = require("./routers/api_router");

const app = express();

app.use(express.static(path.join(__dirname, "../../public")));
app.use(bodyParser.json());
app.use(express.static("public"));

app.use("/api/v1/", api_router);

app.use((err, req, res, next) => {
  console.log(err.errors[0].messages[0]);
  res.status(400).json(err);
});

module.exports = app;
