module Routes.ServicesPage exposing (..)

-- import Html.Events exposing (..)

import Components.Rule exposing (..)
import Components.ServiceListItem exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


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
        , actionButtons
        ]


actionButtons : Html Msg
actionButtons =
    section [ class "action-buttons center w-90 mt3" ]
        [ div []
            [ div []
                [ a [ class "db bg-light-purple br2 pa3 tc m0 dim white no-underline mb3", href "#talk-to-us" ] [ text "Talk to us" ]
                ]
            , a [ class "db relative ba b--purple br2 pa3 tc ma0 dim purple no-underline mb4", href "#quotes" ] [ text "Back to stories" ]
            ]
        ]
