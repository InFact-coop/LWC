const path = require("path");
const express = require("express");
const bodyParser = require("body-parser");

const app = express();

app.use(express.static(path.join(__dirname, "../../public")));
app.use(bodyParser.json());
app.use(express.static("public"));

module.exports = app;
