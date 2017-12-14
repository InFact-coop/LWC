module Routes.FormPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


formPage : Model -> Html Msg
formPage model =
    div [ class "" ]
        [ h1 [ class "tc f1" ] [ text "Form" ]
        ]
