module Components.PurpleButton exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


purpleButton : ( String, String ) -> Html Msg
purpleButton ( name, route ) =
    div [ class "mb3" ]
        [ div [ class "bg-purple w-90 br2 pa3 tc dim mb3 m0-auto" ]
            [ a [ href ("#" ++ route), class "tc white no-underline" ] [ text name ]
            ]
        ]
