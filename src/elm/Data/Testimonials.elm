module Data.Testimonials exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


emphasis : String -> Html Msg
emphasis content =
    span [ class "purple b" ] [ text content ]


defaultTestimonial : Testimonial
defaultTestimonial =
    { id = 1
    , name = "Maureen"
    , age = "34"
    , imgsrc = "./assets/woman1.png"
    , therapy = "Money Advice"
    , description =
        section [ class "description ph3 pt0" ]
            [ p []
                [ text "Maureen had gotten into "
                , emphasis "debt problems"
                , text " with an energy supplier. She saw an advisor from "
                , emphasis "Money, Debt & Benefit Advice"
                , text " over 4 sessions to tackle the issue."
                ]
            , p []
                [ text "As a result, over £3,500 of her debt was written off and she was successful in her application for a "
                , emphasis "£140 Warm Home Discount"
                , text " also. The financial pressure she was feeling "
                , emphasis "has now gone"
                , text " and she feels "
                , emphasis "much happier"
                , text "."
                ]
            ]
    }


testimonialsList : List Testimonial
testimonialsList =
    [ defaultTestimonial
    , { id = 2
      , name = "Emma"
      , age = "43"
      , imgsrc = "./assets/woman2.png"
      , therapy = "Money Advice"
      , description =
            section [ class "description ph3 pt0" ]
                [ p []
                    [ text "Emma did not know which way to turn after a recent seperation. After just 2 adviser appointments with our "
                    , emphasis "Money, Debt & Benefit Advice"
                    , text " Service, benefits worth £4882.80 have been confirmed as being in payment and an application for further benefits has been put in with the advisor's help."
                    ]
                , p []
                    [ text "Emma now feels much more "
                    , emphasis "supported"
                    , text " and knows that help is always on hand for form filling , advice and money matters"
                    ]
                ]
      }
    , { id = 3
      , name = "Aisha"
      , age = "40"
      , imgsrc = "./assets/woman3.png"
      , therapy = "Employment, Mindfit"
      , description =
            section [ class "description ph3 pt0" ]
                [ p []
                    [ text "Aisha has previously worked in the same job for a number of years. Unfortunately she was subject to some "
                    , emphasis "bullying in the workplace"
                    , text " which affected her confidence, self-esteem and anxiety levels. For the first time she was unemployed."
                    ]
                , p []
                    [ text "Aisha accessed "
                    , emphasis "Employment Support"
                    , text " and completed "
                    , emphasis "Mindfit"
                    , text " courses to help improve her confidence and self worth. She also completed the "
                    , emphasis "Why Worry"
                    , text " course. Aisha completed volunteering, applied for a course on mental health, updated her CV, practised interview techniques and eventually found part time work."
                    ]
                ]
      }
    , { id = 4
      , name = "Mariama"
      , age = "32"
      , imgsrc = "./assets/woman4.png"
      , therapy = "Living Well"
      , description =
            section [ class "description ph3 pt0" ]
                [ p []
                    [ text "Mariama came to LWC after she was diagnosed with "
                    , emphasis "low mood"
                    , text " and "
                    , emphasis "anxiety"
                    , text ". She was feeling isolated in social situations and became a bit of a recluse."
                    ]
                , p []
                    [ text "She began by attending "
                    , emphasis "Living Well therapy sessions"
                    , text ", which really helped her. Afterwards she went to "
                    , emphasis "Behavioural Activation"
                    , text " to address some of her negative thoughts and emotions. With support we saw Mariama increase socialise more with improved her anxiety levels and feel better in herself. After engaging with this therapy, Mariama also felt able to discuss some childhood trauma which has seen her engage in 1 to 1 counselling"
                    ]
                ]
      }
    , { id = 5
      , name = "Prisha"
      , age = "66"
      , imgsrc = "./assets/woman5.png"
      , therapy = "Living Well"
      , description =
            section [ class "description ph3 pt0" ]
                [ p []
                    [ text "Prisha first attended the "
                    , emphasis "Living Well"
                    , text " sessions held at a community venue. She came in extremely nervous, teary and worried. Prisha suffers from sciatica pain and a rotator cuff injury, which has resulted in her feeling "
                    , emphasis "miserable"
                    , text ", with "
                    , emphasis "trouble relaxing"
                    , text " and"
                    , emphasis " difficulty in sleeping"
                    , text ". In addition, Prisha had recently lost her daughter to cancer."
                    ]
                , p []
                    [ text "Each week, Prisha attended the session with "
                    , emphasis "enthusiasm"
                    , text " and a "
                    , emphasis "thirst to learn more"
                    , text ", acknowledging her strengths and weaknesses. Prisha would practice the therapy techniques learnt during the sessions once she returned home (her husband would also participate alongside her). She would return the next week "
                    , emphasis "elated"
                    , text " announcing the sessions are helping with her mood. She ‘feels less grumpy with children and grandchildren, more motivated, wants to learn more and volunteer’."
                    ]
                ]
      }
    , { id = 6
      , name = "CJ"
      , age = "22"
      , imgsrc = "./assets/woman6.png"
      , therapy = "Women in Prison"
      , description =
            section [ class "description ph3 pt0" ]
                [ p []
                    [ text "CJ is a 22 year old who came into contact with LWC following "
                    , emphasis "release from Prison"
                    , text ". CJ had been referred for support in the community. At assessment, she was focused on getting back into work or education and wanted to make some positive changes in her life. CJ had some basic needs to address as she had "
                    , emphasis "no income"
                    , text ", "
                    , emphasis "no GP"
                    , text " and her accommodation was not suitable which could lead to recall to prison. We put her in touch with one of our caseworkers who helped CJ find "
                    , emphasis "alternative suitable accommodation"
                    , text ", made contact with the "
                    , emphasis "local alcohol support team"
                    , text " and she met with "
                    , emphasis "LWC Money Advisors"
                    , text " to claim any benefits she was entitled too."
                    ]
                , p []
                    [ text "Once accommodation was in place CH engaged well and worked with the employment support team to update CV, disclosure work on interview skills. CJ has maintained the "
                    , emphasis "new tenancy"
                    , text " is "
                    , emphasis "sober"
                    , text " and is currently volunteering. She hopes to secure "
                    , emphasis "paid employment"
                    , text " in the near future."
                    ]
                ]
      }
    ]
