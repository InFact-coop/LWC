require("../../config.js");

const should = require("chai").should();
const expect = require("chai").expect;
const supertest = require("supertest");
const app = require("../../src/server/app");

describe("Dummy test", () => {
  it("1+1 should return 2", () => {
    expect(1 + 1).to.equal(2);
  });
});

const goodData = {
  Name: "Matthew Davis",
  DOB: "2018-01-06",
  "Contact Number": "34567890",
  Email: "email@gmail.com",
  Postcode: "SN13 9SY",
  "Areas of Interest": ["Personal Development", "Employment Support"],
  "More Info": "Some things",
  GDPR: true
};

describe("Static files", () => {
  it("GET / returns our app", done => {
    supertest(app)
      .get("/")
      .end((err, res) => {
        if (err) {
          done(err);
        }
        expect(res.statusCode).to.equal(200);
        expect(res.type).to.equal("text/html");
        done();
      });
  });
  it("GET /style.min.css returns css file", done => {
    supertest(app)
      .get("/style.min.css")
      .end((err, res) => {
        if (err) {
          done(err);
        }
        expect(res.statusCode).to.equal(200);
        expect(res.type).to.equal("text/css");
        done();
      });
  });
  it("GET /elm.js returns js file", done => {
    supertest(app)
      .get("/elm.js")
      .end((err, res) => {
        if (err) {
          done(err);
        }
        expect(res.statusCode).to.equal(200);
        expect(res.type).to.equal("application/javascript");
        done();
      });
  });
});

describe("API testing", () => {
  describe("POST :/api/v1/user_form", () => {
    it("Should get 5 errors back when sending empty", done => {
      supertest(app)
        .post("/api/v1/help_form")
        .end((err, res) => {
          if (err) {
            done(err);
          }
          expect(res.statusCode).to.equal(400);
          const response = JSON.parse(res.text);
          const errors = response.errors;
          errors.length.should.equal(5);
          errors[0].messages[0].should.equal('"Name" is required');
          errors[1].messages[0].should.equal('"DOB" is required');
          errors[2].messages[0].should.equal('"Contact Number" is required');
          errors[3].messages[0].should.equal('"Email" is required');
          errors[4].messages[0].should.equal('"Postcode" is required');
          done();
        });
    });

    it("Should get success:true back when sending info", function(done) {
      this.timeout(15000);
      supertest(app)
        .post("/api/v1/help_form")
        .send(goodData)
        .end((err, res) => {
          if (err) {
            done(err);
          }
          expect(res.type).to.equal("application/json");
          expect(res.statusCode).to.equal(200);
          expect(res.body.success).to.equal(true);
          done();
        });
    });
  });
});
