module Components.Emphasis exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


emphasis : String -> Html Msg
emphasis content =
    span [ class "purple b" ] [ text content ]
