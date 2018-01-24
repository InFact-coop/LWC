module Data.Testimonials exposing (..)

import Components.Emphasis exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


defaultTestimonial : Testimonial
defaultTestimonial =
    testimonialMaker 1
        "Maureen"
        "34"
        "./assets/woman1.png"
        "Money Advice"
        "Maureen had gotten into debt problems with an energy supplier. She saw an advisor from Money, Debt & Benefit Advice over 4 sessions to tackle the issue."
        "As a result, over £3,500 of her debt was written off and she was successful in her application for a £140 Warm Home Discoun also. The financial pressure she was feeling has now gon  and she feels much happier."

testimonialMaker: Int -> String -> String -> String -> String -> String -> String -> Testimonial
testimonialMaker id name age imgsrc therapy p1 p2 =
    { id = id
    , name = name
    , age = age
    , imgsrc = imgsrc
    , therapy = therapy
    , description = section [ class "description ph3 pt0" ]
            [ p [] [ text p1 ]
            , p [] [ text p2]
            ]
    }


testimonialsList : List Testimonial
testimonialsList =
    [ testimonialMaker 1
        "Maureen"
        "34"
        "./assets/woman1.png"
        "Money Advice"
        "Maureen had gotten into debt problems with an energy supplier. She saw an advisor from Money, Debt & Benefit Advice over 4 sessions to tackle the issue."
        "As a result, over £3,500 of her debt was written off and she was successful in her application for a £140 Warm Home Discoun also. The financial pressure she was feeling has now gon  and she feels much happier."
    , testimonialMaker 2
        "Emma"
        "43"
        "./assets/woman2.png"
        "Money Advice"
        "Emma did not know which way to turn after a recent seperation. After just 2 adviser appointments with our Money, Debt & Benefit Advice Service, benefits worth £4882.80 have been confirmed as being in payment and an application for further benefits has been put in with the advisor's help."
        "Emma now feels much more supported and knows that help is always on hand for form filling , advice and money matters"
    , testimonialMaker 3
        "Aisha"
        "40"
        "./assets/woman3.png"
        "Employment, Mindfit"
        "Aisha has previously worked in the same job for a number of years. Unfortunately she was subject to some bullying in the workplace which affected her confidence, self-esteem and anxiety levels. For the first time she was unemployed."
        "Aisha accessed Employment Support and completed Mindfit courses to help improve her confidence and self worth. She also completed the Why Worry course. Aisha completed volunteering, applied for a course on mental health, updated her CV, practised interview techniques and eventually found part time work."
    , testimonialMaker 4
        "Mariama"
        "32"
        "./assets/woman4.png"
        "Living Well"
        "Mariama came to LWC after she was diagnosed with low mood and anxiety She was feeling isolated in social situations and became a bit of a recluse."
        "She began by attending Living Well therapy sessions which really helped her. Afterwards she went to Behavioural Activation to address some of her negative thoughts and emotions. With support we saw Mariama increase socialise more with improved her anxiety levels and feel better in herself. After engaging with this therapy, Mariama also felt able to discuss some childhood trauma which has seen her engage in 1 to 1 counselling"
    , testimonialMaker 5
        "Prisha"
        "66"
        "./assets/woman5.png"
        "Living Well"
        "Prisha first attended the Living Well sessions held at a community venue. She came in extremely nervous, teary and worried. Prisha suffers from sciatica pain and a rotator cuff injury, which has resulted in her feeling miserable, with trouble relaxing and difficulty in sleeping. In addition, Prisha had recently lost her daughter to cancer."
        "Each week, Prisha attended the session with enthusiasm and a thirst to learn more, acknowledging her strengths and weaknesses. Prisha would practice the therapy techniques learnt during the sessions once she returned home (her husband would also participate alongside her). She would return the next week elated announcing the sessions are helping with her mood. She ‘feels less grumpy with children and grandchildren, more motivated, wants to learn more and volunteer’."
    , testimonialMaker 6
        "CJ"
        "22"
        "./assets/woman6.png"
        "Women in Prison"
        "CJ is a 22 year old who came into contact with LWC following release from Prison. CJ had been referred for support in the community. At assessment, she was focused on getting back into work or education and wanted to make some positive changes in her life. CJ had some basic needs to address as she had no income, no GP and her accommodation was not suitable which could lead to recall to prison. We put her in touch with one of our caseworkers who helped CJ find alternative suitable accommodation, made contact with the local alcohol support teamand she met with LWC Money Advisorsto claim any benefits she was entitled too."
        "Once accommodation was in place CH engaged well and worked with the employment support team to update CV, disclosure work on interview skills. CJ has maintained the new tenancy is sober and is currently volunteering. She hopes to secure paid employment in the near future."
    ]
