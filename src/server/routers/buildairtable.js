require("../../../config.js");
const Airtable = require("airtable");
const base = Airtable.base("appm7MndHx6fL8p5K");
const formValidator = require("../validation/form");

Airtable.configure({
  endpointUrl: "https://api.airtable.com",
  apiKey: process.env.AIRTABLE_API_KEY
});

const info = [
  {
    Name: "Maureen",
    Age: "34",
    "Image source": "./assets/woman1.png",
    Therapy: "Money Advice",
    "Long Quote Part One":
      "Maureen had gotten into debt problems with an energy supplier. She saw an advisor from Money, Debt & Benefit Advice over 4 sessions to tackle the issue.",
    "Long Quote Part Two":
      "As a result, over £3,500 of her debt was written off and she was successful in her application for a £140 Warm Home Discoun also. The financial pressure she was feeling has now gon  and she feels much happier."
  },
  {
    Name: "Emma",
    Age: "43",
    "Image source": "./assets/woman2.png",
    Therapy: "Money Advice",
    "Long Quote Part One":
      "Emma did not know which way to turn after a recent seperation. After just 2 adviser appointments with our Money, Debt & Benefit Advice Service, benefits worth £4882.80 have been confirmed as being in payment and an application for further benefits has been put in with the advisor's help.",
    "Long Quote Part Two":
      "Emma now feels much more supported and knows that help is always on hand for form filling , advice and money matters"
  },
  {
    Name: "Aisha",
    Age: "40",
    "Image source": "./assets/woman3.png",
    Therapy: "Employment, Mindfit",
    "Long Quote Part One":
      "Aisha has previously worked in the same job for a number of years. Unfortunately she was subject to some bullying in the workplace which affected her confidence, self-esteem and anxiety levels. For the first time she was unemployed.",
    "Long Quote Part Two":
      "Aisha accessed Employment Support and completed Mindfit courses to help improve her confidence and self worth. She also completed the Why Worry course. Aisha completed volunteering, applied for a course on mental health, updated her CV, practised interview techniques and eventually found part time work."
  },
  {
    Name: "Mariama",
    Age: "32",
    "Image source": "./assets/woman4.png",
    Therapy: "Living Well",
    "Long Quote Part One":
      "Mariama came to LWC after she was diagnosed with low mood and anxiety She was feeling isolated in social situations and became a bit of a recluse.",
    "Long Quote Part Two":
      "She began by attending Living Well therapy sessions which really helped her. Afterwards she went to Behavioural Activation to address some of her negative thoughts and emotions. With support we saw Mariama increase socialise more with improved her anxiety levels and feel better in herself. After engaging with this therapy, Mariama also felt able to discuss some childhood trauma which has seen her engage in 1 to 1 counselling"
  },
  {
    Name: "Prisha",
    Age: "66",
    "Image source": "./assets/woman5.png",
    Therapy: "Living Well",
    "Long Quote Part One":
      "Prisha first attended the Living Well sessions held at a community venue. She came in extremely nervous, teary and worried. Prisha suffers from sciatica pain and a rotator cuff injury, which has resulted in her feeling miserable, with trouble relaxing and difficulty in sleeping. In addition, Prisha had recently lost her daughter to cancer.",
    "Long Quote Part Two":
      "Each week, Prisha attended the session with enthusiasm and a thirst to learn more, acknowledging her strengths and weaknesses. Prisha would practice the therapy techniques learnt during the sessions once she returned home (her husband would also participate alongside her). She would return the next week elated announcing the sessions are helping with her mood. She ‘feels less grumpy with children and grandchildren, more motivated, wants to learn more and volunteer’."
  },
  {
    Name: "CJ",
    Age: "22",
    "Image source": "./assets/woman6.png",
    Therapy: "Women in Prison",
    "Long Quote Part One":
      "CJ is a 22 year old who came into contact with LWC following release from Prison. CJ had been referred for support in the community. At assessment, she was focused on getting back into work or education and wanted to make some positive changes in her life. CJ had some basic needs to address as she had no income, no GP and her accommodation was not suitable which could lead to recall to prison. We put her in touch with one of our caseworkers who helped CJ find alternative suitable accommodation, made contact with the local alcohol support teamand she met with LWC Money Advisorsto claim any benefits she was entitled too.",
    "Long Quote Part Two":
      "Once accommodation was in place CH engaged well and worked with the employment support team to update CV, disclosure work on interview skills. CJ has maintained the new tenancy is sober and is currently volunteering. She hopes to secure paid employment in the near future."
  }
];

info.forEach(testimonial => {
  base("LWC Testimonials").create(testimonial, (err, record) => {
    if (err) {
      console.log("Error with Airtable: ", err);
      return;
    }
    return console.log("Data added");
  });
});
