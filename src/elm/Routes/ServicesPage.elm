module Routes.ServicesPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


servicesPage : Model -> Html Msg
servicesPage model =
    div [ class "" ]
        [ h1 [ class "tc f1" ] [ text "Services" ]
        ]
