module Routes.DetailedQuotePage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


detailedQuotePage : Model -> Html Msg
detailedQuotePage model =
    div [ class "" ]
        [ h1 [ class "tc f1" ] [ text "Detailed Quote" ]
        ]
