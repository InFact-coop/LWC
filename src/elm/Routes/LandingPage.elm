module Routes.LandingPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


landingPage : Model -> Html Msg
landingPage model =
    div [ class "" ]
        [ h1 [ class "tc f1" ] [ text "Landing" ]
        ]
