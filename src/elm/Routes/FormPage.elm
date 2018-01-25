module Routes.FormPage exposing (..)

import Components.Buttons exposing (..)
import Components.Form exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


formPage : Model -> Html Msg
formPage model =
    div [ class "ma4" ]
        [ div [ class "b gray f3 mb3", id "whole-page" ]
            [ text "Your details" ]
        , div
            [ class "gray fw1 mb4" ]
            [ text "So we can get in touch with you we just need a few details" ]
        , div
            [ class "purple-line fl pl3 mb4" ]
            []
        , detailsForm model
        , clearWhiteButton "Back" "talk-to-us"
        ]
