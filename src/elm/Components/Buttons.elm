module Components.Buttons exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


clearWhiteButton : String -> String -> Html Msg
clearWhiteButton name route =
    genericButton "ma3" "ba b--purple w-90 br2 pa3 tc dim mb3 m0-auto w-40-l" "tc purple no-underline" name route


whiteButton : String -> String -> Html Msg
whiteButton name route =
    genericButton "" "ma3" "purple bg-white-80 tracked pa4 dim br2 db tc w-80 m0-auto mt4 no-underline" name route


purpleButton : String -> String -> Html Msg
purpleButton name route =
    genericButton "ma3" "bg-purple w-90 w-30-l br2 pa3 tc dim mb3 m0-auto" "tc white no-underline" name route


genericButton : String -> String -> String -> String -> String -> Html Msg
genericButton divClass buttonClass linkClass name route =
    div [ class divClass ]
        [ div [ class buttonClass ]
            [ a [ href ("#" ++ route), class linkClass ] [ text name ]
            ]
        ]
