module Data.Testimonials exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


defaultTestimonial : Testimonial
defaultTestimonial =
    { name = "Linda"
    , age = "37"
    , therapy = "Living Well"
    , description =
        section [ class "description" ]
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
    [ { name = "Linda"
      , age = "37"
      , therapy = "Living Well"
      , description =
            section [ class "description" ]
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
    , { name = "Marticia"
      , age = "37"
      , therapy = "Living Dandy"
      , description =
            section [ class "description" ]
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
