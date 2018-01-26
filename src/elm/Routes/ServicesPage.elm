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
    div [ class "mh5-ns" ]
        [ div [ class "gray f2 b ma4" ] [ text "Our Services" ]
        , div [ class "gray fw1 mv3 mb4-ns w-50-l mh4" ]
            [ text "A list of our most used services."
            ]
        , div [ class "purple-line mb4 mh4" ] []
        , ul [ class "pa3 ma3" ]
            (List.map
                serviceListItem
                model.services
            )
        , div [ class "dn-l" ] [ purpleButton "Contact us" "talk-to-us" ]
        , div [ class "dn-l" ] [ clearWhiteButton "Back to stories" "quotes" ]
        ]
