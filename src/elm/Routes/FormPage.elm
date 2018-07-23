module Routes.FormPage exposing (..)

import Components.Buttons exposing (..)
import Components.Form exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Utils exposing (routeToColour)


formPage : Model -> Html Msg
formPage model =
    div [ class "ma4" ]
        [ div [ class <| routeToColour model.route ++ " b f3 mb3 ttu heading", id "whole-page" ]
            [ text "Your details" ]
        , div
            [ class "gray fw1 mb4" ]
            [ text "So we can get in touch with you we just need a few details" ]
        , div
            [ class "black-line fl pl3 mb4" ]
            []
        , detailsForm model
        , clearWhiteButton "Back" "talk-to-us"
        ]
