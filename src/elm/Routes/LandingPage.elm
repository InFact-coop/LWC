module Routes.LandingPage exposing (..)

import Components.Buttons exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


landingPage : Model -> Html Msg
landingPage model =
    div []
        [ div [ class "hands group" ]
            [ div [ class "purple-background w-100 h-100 " ]
                [ div [ class "white b f2  f1-l tc ph3-ns ph2 pt5-ns pt4 tracked w-70-l m0-auto" ]
                    [ text "We are here to help." ]
                , div [ class "white-line pb4" ] []
                , div [ class "tc-l" ]
                    [ div [ class "pt5-l w-50-l tc-l dib-l " ] [ whiteButton "READ REAL STORIES" "quotes" ]
                    ]
                , div [ class "tc-l" ]
                    [ div [ class "pt1-l w-50-l tc-l dib-l  " ] [ whiteButton "OUR SERVICES" "services" ]
                    ]
                , div [ class "tc-l" ]
                    [ div [ class "pt1-l w-50-l tc-l dib-l" ] [ whiteButton "CONTACT US" "talk-to-us" ]
                    ]
                ]
            ]
        ]
