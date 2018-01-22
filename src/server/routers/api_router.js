const router = require("express").Router();
const validate = require("express-validation");
const Airtable = require("airtable");
const base = Airtable.base(process.env.AIRTABLE_BASE);
const formValidator = require("../validation/form");

Airtable.configure({
  endpointUrl: "https://api.airtable.com",
  apiKey: process.env.AIRTABLE_API_KEY
});

const postController = (req, res, next) => {
  const { GDPR, ...filteredData } = Object.assign(req.body, {
    DOB: new Date(req.body.DOB)
  });

  if (!GDPR) {
    const GDPRError = new Error("Not GDPR compliant");
    return next(GDPRError);
  }

  base(process.env.AIRTABLE_TABLE).create(filteredData, (err, record) => {
    if (err) {
      console.log("Error with Airtable: ", err);
      return next(err);
    }
    return res.json({ success: true });
  });
};

router.route("/help_form").post(validate(formValidator), postController);

module.exports = router;
