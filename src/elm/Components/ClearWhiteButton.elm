module Components.ClearWhiteButton exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


clearWhiteButton : ( String, String ) -> Html Msg
clearWhiteButton ( name, route ) =
    div [ class "mb3" ]
        [ div [ class "w-90 br2 pa3 tc dim mb3 m0-auto ba b--purple" ]
            [ a [ href ("#" ++ route), class "tc purple no-underline" ] [ text name ]
            ]
        ]



-- , a [ class "db relative ba b--purple br2 pa3 tc m0-auto dim purple no-underline mb4 w-90", href "#quotes" ] [ text "Back to stories" ]
