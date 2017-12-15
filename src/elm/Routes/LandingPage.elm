module Routes.LandingPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


landingPage : Model -> Html Msg
landingPage model =
    div [ class "hands" ]
        [ div [ class "purple-background w-100 h-100 " ]
            [ div [ class "white b f2 tc pl3 pr3 pt5 tracked" ]
                [ text "We are here to help." ]
            , div [ class "white-line pb4" ] []
            , div [ class "mt5" ] [ a [ class "purple bg-white-80 tracked pa4 dim br2 db tc w-80 m0-auto mt4 no-underline", href "#quotes" ] [ text "NEED SUPPORT?" ] ]
            , div [ class "mt4" ] [ a [ class "purple bg-white-80 tracked pa4 dim br2 db tc w-80 m0-auto mt4 no-underline", href "#services" ] [ text "KNOW WHAT YOU NEED?" ] ]
            ]
        ]
