module Routes.ThankYouPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


thankYouPage : Model -> Html Msg
thankYouPage model =
    div [ class "" ]
        [ h1 [ class "tc f1" ] [ text "Thank You" ]
        ]
