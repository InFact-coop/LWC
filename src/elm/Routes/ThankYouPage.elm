module Routes.ThankYouPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


thankYouPage : Model -> Html Msg
thankYouPage model =
    div [ class "hands " ]
        [ div [ class "purple-background w-100 h-100 pa-25" ]
            [ div [ class "white b f2 tc pl3 pr3 pt5 tracked" ]
                [ text "Thank you" ]
            , div [ class "white-line pb4" ] []
            , div [ class "white tracked tc fw1 mt4" ] [ text "We'll be in touch within 72 hours" ]
            ]
        ]
