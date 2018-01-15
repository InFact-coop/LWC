module Components.WhiteButton exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


whiteButton : ( String, String ) -> Html Msg
whiteButton ( name, route ) =
    div [ class "mt4" ]
        [ a [ class "purple bg-white-80 tracked pa4 dim br2 db tc w-80 m0-auto mt4 no-underline", href ("#" ++ route) ] [ text name ]
        ]
