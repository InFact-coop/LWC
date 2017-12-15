module Components.QuotesListItem exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


quotesListItem : ( String, String ) -> Html Msg
quotesListItem ( photo, quote ) =
    div []
        [ div [] [ text quote ]
        , div []
            [ img [ src photo ] []
            ]
        ]
