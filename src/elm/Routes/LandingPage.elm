module Routes.LandingPage exposing (..)

import Components.Buttons exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


landingPage : Model -> Html Msg
landingPage model =
    div []
        [ div [ class "hands dn-l" ]
            [ div [ class "purple-background w-100 h-100 " ]
                [ div [ class "white b f2 tc pl3 pr3 pt5 tracked" ]
                    [ text "We are here to help." ]
                , div [ class "white-line pb4" ] []
                , whiteButton "SEE REAL STORIES" "quotes"
                , whiteButton "SEE OUR SERVICES" "services"
                , whiteButton "CONTACT US" "talk-to-us"
                ]
            ]
        , div [ class " group dib-l dn" ]
            [ div [ class "purple-background w-100 h-100 " ]
                [ div [ class "white b f1 tc pl3 pr3 pt5 tracked w-50 m0-auto" ]
                    [ text "We are here to help." ]
                , div [ class "white-line pb4 " ] []
                , div [ class "tc" ]
                    [ div [ class "pt5 w-50 tc dib " ] [ whiteButton "SEE REAL STORIES" "quotes" ]
                    ]
                , div [ class "tc" ]
                    [ div [ class "pt1 w-50 tc dib " ] [ whiteButton "SEE OUR SERVICES" "services" ]
                    ]
                , div [ class "tc" ]
                    [ div [ class "pt1 w-50 tc dib " ] [ whiteButton "CONTACT US" "talk-to-us" ]
                    ]
                ]
            ]
        ]
