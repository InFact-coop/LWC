module Data.Testimonials exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


emphasis : String -> Html Msg
emphasis content =
    span [ class "purple b" ] [ text content ]


defaultTestimonial : Testimonial
defaultTestimonial =
    { id = 4
    , name = ""
    , age = "37"
    , imgsrc = "./assets/woman2.png"
    , therapy = "Living Well"
    , description =
        section [ class "description ph3 pt0" ]
            [ p []
                [ text "I came to LWC about three years ago after I was diagnosed with "
                , emphasis "low mood"
                , text " and "
                , emphasis "anxiety"
                , text ". I was feeling really isolated in social situations and became a bit of a recluse."
                ]
            , p []
                [ text "I began by attending "
                , emphasis "Living Well therapy sessions"
                , text ", which really really helped me. Later on I went to "
                , emphasis "Behavioural Activation"
                , text " to address some of the negative thoughts I’d been having. "
                ]
            ]
    }


testimonialsList : List Testimonial
testimonialsList =
    [ { id = 1
      , name = "Maureen"
      , age = "34"
      , imgsrc = "./assets/woman1.png"
      , therapy = "Money, Debt & Benefit Advice"
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
    , { id = 2
      , name = "Emma"
      , age = "43"
      , imgsrc = "./assets/woman2.png"
      , therapy = "Money, Debt & Benefit Advice"
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
      , name = "Marticia"
      , age = "37"
      , imgsrc = "./assets/woman1.png"
      , therapy = "Living Dandy"
      , description =
            section [ class "description ph3 pt0" ]
                [ p []
                    [ text "I came to LWC about three years ago after I was diagnosed with "
                    , emphasis "low mood"
                    , text " and "
                    , emphasis "anxiety"
                    , text ". I was feeling really isolated in social situations and became a bit of a recluse."
                    ]
                , p []
                    [ text "I began by attending "
                    , emphasis "Living Well therapy sessions"
                    , text ", which really really helped me. Later on I went to "
                    , emphasis "Behavioural Activation"
                    , text " to address some of the negative thoughts I’d been having. "
                    ]
                ]
      }
    , { id = 4
      , name = "Linda"
      , age = "37"
      , imgsrc = "./assets/woman2.png"
      , therapy = "Living Well"
      , description =
            section [ class "description ph3 pt0" ]
                [ p []
                    [ text "I came to LWC about three years ago after I was diagnosed with "
                    , emphasis "low mood"
                    , text " and "
                    , emphasis "anxiety"
                    , text ". I was feeling really isolated in social situations and became a bit of a recluse."
                    ]
                , p []
                    [ text "I began by attending "
                    , emphasis "Living Well therapy sessions"
                    , text ", which really really helped me. Later on I went to "
                    , emphasis "Behavioural Activation"
                    , text " to address some of the negative thoughts I’d been having. "
                    ]
                ]
      }
    , { id = 5
      , name = "Mariama"
      , age = "23"
      , imgsrc = "./assets/woman1.png"
      , therapy = "Meh"
      , description =
            section [ class "description ph3 pt0" ]
                [ p []
                    [ text "I came to LWC about three years ago after I was diagnosed with "
                    , emphasis "low mood"
                    , text " and "
                    , emphasis "anxiety"
                    , text ". I was feeling really isolated in social situations and became a bit of a recluse."
                    ]
                , p []
                    [ text "I began by attending "
                    , emphasis "Living Well therapy sessions"
                    , text ", which really really helped me. Later on I went to "
                    , emphasis "Behavioural Activation"
                    , text " to address some of the negative thoughts I’d been having. "
                    ]
                ]
      }
    , { id = 6
      , name = "Marticia"
      , age = "37"
      , imgsrc = "./assets/woman1.png"
      , therapy = "Living Dandy"
      , description =
            section [ class "description ph3 pt0" ]
                [ p []
                    [ text "I came to LWC about three years ago after I was diagnosed with "
                    , emphasis "low mood"
                    , text " and "
                    , emphasis "anxiety"
                    , text ". I was feeling really isolated in social situations and became a bit of a recluse."
                    ]
                , p []
                    [ text "I began by attending "
                    , emphasis "Living Well therapy sessions"
                    , text ", which really really helped me. Later on I went to "
                    , emphasis "Behavioural Activation"
                    , text " to address some of the negative thoughts I’d been having. "
                    ]
                ]
      }
    ]
