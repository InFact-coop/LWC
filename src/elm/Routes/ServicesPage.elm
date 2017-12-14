module Routes.ServicesPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- import Html.Events exposing (..)

import Types exposing (..)
import Components.Rule exposing (..)
import Components.ServiceListItem exposing (..)


servicesPage : Model -> Html Msg
servicesPage model =
    div [ class "" ]
        [ header [ class "header pl3" ]
            [ h1 [ class "tl f3 fw7 gray mb1" ] [ text "Our Services" ]
            , p [ class "mt1" ] [ text "A list of our most used services" ]
            , rule "purple" "25%"
            ]
        , ul [ class "pa3" ]
            (List.map
                serviceListItem
                model.services
            )
        ]
