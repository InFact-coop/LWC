module Data.Testimonials exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


defaultTestimonial : Testimonial
defaultTestimonial =
    { id = 4
    , name = "Linda"
    , age = "37"
    , imgsrc = "./assets/woman2.png"
    , therapy = "Living Well"
    , description =
        section [ class "description ph3 pt0" ]
            [ p []
                [ text "I came to LWC about three years ago after I was diagnosed with "
                , span [ class "purple b" ]
                    [ text "low mood" ]
                , text " and "
                , span [ class "purple b" ]
                    [ text "anxiety" ]
                , text ". I was feeling really isolated in social situations and became a bit of a recluse."
                ]
            , p []
                [ text "I began by attending "
                , span [ class "purple b" ]
                    [ text "Living Well therapy sessions" ]
                , text ", which really really helped me. Later on I went to "
                , span [ class "purple b" ]
                    [ text "Behavioural Activation" ]
                , text "to address some of the negative thoughts I’d been having. "
                ]
            ]
    }


testimonialsList : List Testimonial
testimonialsList =
    [ { id = 4
      , name = "Linda"
      , age = "37"
      , imgsrc = "./assets/woman2.png"
      , therapy = "Living Well"
      , description =
            section [ class "description ph3 pt0" ]
                [ p []
                    [ text "I came to LWC about three years ago after I was diagnosed with "
                    , span [ class "purple b" ]
                        [ text "low mood" ]
                    , text " and "
                    , span [ class "purple b" ]
                        [ text "anxiety" ]
                    , text ". I was feeling really isolated in social situations and became a bit of a recluse."
                    ]
                , p []
                    [ text "I began by attending "
                    , span [ class "purple b" ]
                        [ text "Living Well therapy sessions" ]
                    , text ", which really really helped me. Later on I went to "
                    , span [ class "purple b" ]
                        [ text "Behavioural Activation" ]
                    , text "to address some of the negative thoughts I’d been having. "
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
                    , span [ class "purple b" ]
                        [ text "low mood" ]
                    , text " and "
                    , span [ class "purple b" ]
                        [ text "anxiety" ]
                    , text ". I was feeling really isolated in social situations and became a bit of a recluse."
                    ]
                , p []
                    [ text "I began by attending "
                    , span [ class "purple b" ]
                        [ text "Living Well therapy sessions" ]
                    , text ", which really really helped me. Later on I went to "
                    , span [ class "purple b" ]
                        [ text "Behavioural Activation" ]
                    , text "to address some of the negative thoughts I’d been having. "
                    ]
                ]
      }
    , { id = 2
      , name = "Lola"
      , age = "37"
      , imgsrc = "./assets/woman1.png"
      , therapy = "Living a life"
      , description =
            section [ class "description ph3 pt0" ]
                [ p []
                    [ text "I came to LWC about three years ago after I was diagnosed with "
                    , span [ class "purple b" ]
                        [ text "low mood" ]
                    , text " and "
                    , span [ class "purple b" ]
                        [ text "anxiety" ]
                    , text ". I was feeling really isolated in social situations and became a bit of a recluse."
                    ]
                , p []
                    [ text "I began by attending "
                    , span [ class "purple b" ]
                        [ text "Living Well therapy sessions" ]
                    , text ", which really really helped me. Later on I went to "
                    , span [ class "purple b" ]
                        [ text "Behavioural Activation" ]
                    , text "to address some of the negative thoughts I’d been having. "
                    ]
                ]
      }
    , { id = 1
      , name = "Rivka"
      , age = "27"
      , imgsrc = "./assets/woman1.png"
      , therapy = "Living...just about"
      , description =
            section [ class "description ph3 pt0" ]
                [ p []
                    [ text "I came to LWC about three years ago after I was diagnosed with "
                    , span [ class "purple b" ]
                        [ text "low mood" ]
                    , text " and "
                    , span [ class "purple b" ]
                        [ text "anxiety" ]
                    , text ". I was feeling really isolated in social situations and became a bit of a recluse."
                    ]
                , p []
                    [ text "I began by attending "
                    , span [ class "purple b" ]
                        [ text "Living Well therapy sessions" ]
                    , text ", which really really helped me. Later on I went to "
                    , span [ class "purple b" ]
                        [ text "Behavioural Activation" ]
                    , text "to address some of the negative thoughts I’d been having. "
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
                    , span [ class "purple b" ]
                        [ text "low mood" ]
                    , text " and "
                    , span [ class "purple b" ]
                        [ text "anxiety" ]
                    , text ". I was feeling really isolated in social situations and became a bit of a recluse."
                    ]
                , p []
                    [ text "I began by attending "
                    , span [ class "purple b" ]
                        [ text "Living Well therapy sessions" ]
                    , text ", which really really helped me. Later on I went to "
                    , span [ class "purple b" ]
                        [ text "Behavioural Activation" ]
                    , text "to address some of the negative thoughts I’d been having. "
                    ]
                ]
      }
    , { id = 5
      , name = "Marticia"
      , age = "37"
      , imgsrc = "./assets/woman1.png"
      , therapy = "Living Dandy"
      , description =
            section [ class "description ph3 pt0" ]
                [ p []
                    [ text "I came to LWC about three years ago after I was diagnosed with "
                    , span [ class "purple b" ]
                        [ text "low mood" ]
                    , text " and "
                    , span [ class "purple b" ]
                        [ text "anxiety" ]
                    , text ". I was feeling really isolated in social situations and became a bit of a recluse."
                    ]
                , p []
                    [ text "I began by attending "
                    , span [ class "purple b" ]
                        [ text "Living Well therapy sessions" ]
                    , text ", which really really helped me. Later on I went to "
                    , span [ class "purple b" ]
                        [ text "Behavioural Activation" ]
                    , text "to address some of the negative thoughts I’d been having. "
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
                    , span [ class "purple b" ]
                        [ text "low mood" ]
                    , text " and "
                    , span [ class "purple b" ]
                        [ text "anxiety" ]
                    , text ". I was feeling really isolated in social situations and became a bit of a recluse."
                    ]
                , p []
                    [ text "I began by attending "
                    , span [ class "purple b" ]
                        [ text "Living Well therapy sessions" ]
                    , text ", which really really helped me. Later on I went to "
                    , span [ class "purple b" ]
                        [ text "Behavioural Activation" ]
                    , text "to address some of the negative thoughts I’d been having. "
                    ]
                ]
      }
    ]
