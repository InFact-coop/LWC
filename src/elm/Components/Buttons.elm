module Components.Buttons exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


clearWhiteButton : ( String, String ) -> Html Msg
clearWhiteButton ( name, route ) =
    div [ class "ma3" ]
        [ div [ class "w-90 br2 pa3 tc dim mb3 m0-auto ba b--purple" ]
            [ a [ href ("#" ++ route), class "tc purple no-underline" ] [ text name ]
            ]
        ]


whiteButton : ( String, String ) -> Html Msg
whiteButton ( name, route ) =
    div [ class "ma3" ]
        [ a [ class "purple bg-white-80 tracked pa4 dim br2 db tc w-80 m0-auto mt4 no-underline", href ("#" ++ route) ] [ text name ]
        ]


purpleButton : ( String, String ) -> Html Msg
purpleButton ( name, route ) =
    div [ class "ma3" ]
        [ div [ class "bg-purple w-90 br2 pa3 tc dim mb3 m0-auto" ]
            [ a [ href ("#" ++ route), class "tc white no-underline" ] [ text name ]
            ]
        ]
