module Components.NavBar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Utils exposing (..)
import State exposing (getRoute)
import Types exposing (..)


navbar : Model -> Html Msg
navbar model =
    let
        logo =
            [ a [ href "/#", class "ml5 dn db-l no-underline" ] [ h1 [ class "heading black f3 ttu mw6 dib ma3" ] [ text "Lancashire Women" ] ] ]
    in
        ul [ class "black  dib-l ma0 navbar w-100 pa2-l flex justify-between items-center dn " ] <|
            logo
                ++ [ div [] <| navbarContent model ]


navbarLink : ( String, String, Bool ) -> Html Msg
navbarLink ( linkStr, name, onPage ) =
    let
        colour =
            if onPage then
                getRoute linkStr |> routeToColour
            else
                "gray"
    in
        li [ class "list dib-l ma3 v-top mt4 mr5 mb4 f4 dn" ]
            [ a
                [ class <| "b--" ++ colour ++ " no-underline " ++ colour ++ " wide-spacing pb2"
                , classList [ ( "bb", onPage ) ]
                , href ("/" ++ linkStr)
                ]
                [ text name ]
            ]


navbarContent : Model -> List (Html Msg)
navbarContent model =
    List.map navbarLink
        [ ( "#home", "Home", isActivePage model [] "#home" )
        , ( "#quotes", "Real Stories", isActivePage model [ "#detailed-quote" ] "#quotes" )
        , ( "#services", "Our Services", isActivePage model [] "#services" )
        , ( "#talk-to-us", "Contact Us", isActivePage model [ "#form" ] "#talk-to-us" )
        ]


isActivePage : Model -> List String -> String -> Bool
isActivePage model deeperLinks linkStr =
    linkStr
        :: deeperLinks
        |> List.map (\l -> model.route == getRoute l)
        |> List.member True
