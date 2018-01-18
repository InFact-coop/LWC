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

    it("Should get success:true back when sending info", done => {
      supertest(app)
        .post("/api/v1/help_form")
        .send({
          Name: "Matt",
          DOB: "2018-01-24",
          "Contact Number": "056789998",
          Email: "m@m.m",
          Postcode: "m34 3hr"
        })
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
