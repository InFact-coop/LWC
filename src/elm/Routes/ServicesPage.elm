module Routes.ServicesPage exposing (..)

-- import Html.Events exposing (..)

import Components.Buttons exposing (..)
import Components.Rule exposing (..)
import Components.ServiceListItem exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


servicesPage : Model -> Html Msg
servicesPage model =
    div [ class "mw7-l mh5-l" ]
        [ header [ class "header pl3 ma3" ]
            [ div [ class "tl f2 fw7 gray mb1" ] [ text "Our Services" ]
            , p [ class "" ] [ text "A list of our most used services" ]
            , div [ class "purple-line mb3" ] []
            ]
        , ul [ class "pa3 ma3" ]
            (List.map
                serviceListItem
                model.services
            )
        , div [ class "dn-l" ] [ purpleButton "Contact us" "talk-to-us" ]
        , div [ class "dn-l" ] [ clearWhiteButton "Back to stories" "quotes" ]
        ]
