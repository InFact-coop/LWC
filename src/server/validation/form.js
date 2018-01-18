var Joi = require("joi");

module.exports = {
  body: {
    Name: Joi.string().required(),
    DOB: Joi.string().required(),
    "Contact Number": Joi.string().required(),
    Email: Joi.string()
      .email()
      .required(),
    Postcode: Joi.string().required()
  }
};
