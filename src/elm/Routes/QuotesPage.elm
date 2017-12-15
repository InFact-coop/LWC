module Routes.QuotesPage exposing (..)

import Components.QuotesListItem exposing (..)
import Components.Rule exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


quotesPage : Model -> Html Msg
quotesPage model =
    div [ class "" ]
        [ h1 [ class "tc f1" ] [ text "Quotes" ]
        , ul [ class "pa3" ]
            (List.map
                quotesListItem
                model.quotes
            )
        ]
