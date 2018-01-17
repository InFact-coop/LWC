const router = require("express").Router();
const Airtable = require("airtable");
const base = Airtable.base(process.env.AIRTABLE_BASE);

Airtable.configure({
  endpointUrl: "https://api.airtable.com",
  apiKey: process.env.AIRTABLE_API_KEY
});

router.route("/help_form").post((req, res, next) => {
  const newRow = Object.assign(req.body, { DOB: new Date(req.body.DOB) });
  base(process.env.AIRTABLE_TABLE).create(newRow, (err, record) => {
    if (err) {
      return res.json({ success: false });
    }
    return res.json({ success: true });
  });
});

module.exports = router;
