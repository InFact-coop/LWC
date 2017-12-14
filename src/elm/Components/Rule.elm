module Components.Rule exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


rule : String -> String -> Html Msg
rule colour ruleWidth =
    div [ ruleStyle colour ruleWidth ] []


ruleStyle : String -> String -> Attribute msg
ruleStyle colour ruleWidth =
    style
        [ ( "backgroundColor", colour )
        , ( "height", "0.2rem" )
        , ( "width", ruleWidth )
        ]
