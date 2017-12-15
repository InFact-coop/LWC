module Components.QuotesListItem exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


quotesListItem : ( String, String ) -> Html Msg
quotesListItem ( photo, quote ) =
    div [ class "ba b--silver br1 pa3 mb3" ]
        [ div [ class "tc" ]
            [ div []
                [ img [ src photo ] []
                ]
            , div
                [ class "mb3 gray" ]
                [ img [ src "./assets/quote.svg", class "mb2" ] []
                , text quote
                ]
            , div [ class "w-50 bg-purple br2 m0-auto pa2 mt3" ]
                [ a [ class "white no-underline" ] [ text "Find out more" ]
                ]
            ]
        ]
