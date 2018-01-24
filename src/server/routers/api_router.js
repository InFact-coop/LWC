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

const getTestimonials = (req, res, next) => {
  let testimonials = [];
  base(process.env.AIRTABLE_TABLE_TESTIMONIALS)
    .select({ view: "Grid view" })
    .eachPage(
      (records, fetchNextPage) => {
        const newTestimonial = records.map(record => {
          return Object.assign(record.fields, { id: record.id });
        });
        testimonials = [...testimonials, newTestimonial];
        fetchNextPage();
      },
      err => {
        if (err) {
          return next(err);
        }
        return res.json(testimonials[0]);
      }
    );
};

router.route("/help_form").post(validate(formValidator), postController);
router.route("/testimonials").get(getTestimonials);

module.exports = router;
