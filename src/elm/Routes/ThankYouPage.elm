module Routes.ThankYouPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


thankYouPage : Model -> Html Msg
thankYouPage model =
    a [ href "#home", class "link" ]
        [ div [ class "hands group" ]
            [ div [ class "black-background w-100 h-100 pa-25" ]
                [ div [ class "white b f2 tc pl3 pr3 pt5 tracked f1-l" ]
                    [ text "Thank you" ]
                , div [ class "white-line pb4" ] []
                , div [ class "white tracked tc fw1 mt4 f3-l" ] [ text "We'll be in touch shortly" ]
                ]
            ]
        ]
