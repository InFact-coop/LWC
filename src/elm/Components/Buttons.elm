module Components.Buttons exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


clearWhiteButton : String -> String -> Html Msg
clearWhiteButton name route =
    genericButton "ma3" "ba b--purple w-90 br2 pa3 tc dim mb3 m0-auto w-20-l" "tc purple no-underline" name route


whiteButton : String -> String -> Html Msg
whiteButton name route =
    genericButton "ma3" "purple bg-white-80 tracked pa4-ns ph3 pv4 dim br2 db tc w-80 w-80-l m0-auto mw6-m" "no-underline" name route


purpleButton : String -> String -> Html Msg
purpleButton name route =
    genericButton "ma3" "bg-purple w-90 w-20-l br2 pa3 tc dim mb3 m0-auto" "tc white no-underline" name route


genericButton : String -> String -> String -> String -> String -> Html Msg
genericButton divClass buttonClass linkClass name route =
    a [ href ("#" ++ route), class "no-underline" ]
        [ div [ class divClass ]
            [ div [ class buttonClass ]
                [ div [ class linkClass ] [ text name ]
                ]
            ]
        ]
