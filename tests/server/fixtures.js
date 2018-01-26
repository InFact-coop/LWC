module.exports = {
  goodData: {
    Name: "Matthew Davis",
    DOB: "2018-01-06",
    "Contact Number": "34567890",
    Email: "email@gmail.com",
    Postcode: "SN13 9SY",
    "Areas of Interest": ["Therapy", "Employment Support"],
    "More Info": "Some things",
    GDPR: true
  },
  nonGDPRData: {
    Name: "Matthew Davis",
    DOB: "2018-01-06",
    "Contact Number": "34567890",
    Email: "email@gmail.com",
    Postcode: "SN13 9SY",
    "Areas of Interest": ["Therapy", "Employment Support"],
    "More Info": "Some things",
    GDPR: false
  },
  badAreasOfInterestData: {
    Name: "Matthew Davis",
    DOB: "2018-01-06",
    "Contact Number": "34567890",
    Email: "email@gmail.com",
    Postcode: "SN13 9SY",
    "Areas of Interest": ["Courses", "Employment Support"],
    "More Info": "Some things",
    GDPR: true
  }
};
