var Joi = require("joi");

module.exports = {
  body: {
    Name: Joi.string().required(),
    DOB: Joi.string().required(),
    "Contact Number": Joi.string().required(),
    Email: Joi.string()
      .email()
      .required(),
    Postcode: Joi.string().required(),
    GDPR: Joi.any().valid(true),
    "Areas of Interest": Joi.array().items(
      Joi.string().valid([
        "Emotional Wellbeing",
        "Personal Development",
        "Employment Support",
        "Money, Debt and Benefit Advice",
        "Volunteering and Mentoring",
        "Meeting Others"
      ])
    ),
    "More Info": Joi.string()
  }
};
