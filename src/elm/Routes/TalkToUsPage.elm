module Routes.TalkToUsPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


talkToUsPage : Model -> Html Msg
talkToUsPage model =
    div [ class "" ]
        [ h1 [ class "tc f1" ] [ text "Talk To Us" ]
        ]
