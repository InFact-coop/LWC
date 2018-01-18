module Components.NavBar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import State exposing (getRoute)
import Types exposing (..)


navbar : Model -> Html Msg
navbar model =
    let
        navImg =
            [ a [ href "/#", class "ml5 dn db-ns" ] [ img [ src "./assets/logo.jpg", class "h4" ] [] ] ]
    in
    ul [ class "black dib-ns ma0 navbar w-100 pa2-ns flex justify-between dn" ] <|
        navImg
            ++ [ div [] <| navbarContent model ]


navbarLink : ( String, String, Bool ) -> Html Msg
navbarLink ( linkStr, name, onPage ) =
    li [ class "list dib-ns ma3 v-top mt4 mr5 mb4 f4 dn" ]
        [ a
            [ class "b--purple no-underline black wide-spacing pb2"
            , classList [ ( "bb", onPage ) ]
            , href ("/" ++ linkStr)
            ]
            [ text name ]
        ]


navbarContent : Model -> List (Html Msg)
navbarContent model =
    List.map navbarLink
        [ ( "#home", "Home", isActivePage model "#landing" )
        , ( "#quotes", "Real Stories", isActivePage model "#quotes" )
        , ( "#services", "Our Services", isActivePage model "#services" )
        , ( "#talk-to-us", "Contact Us", isActivePage model "#talk-to-us" )
        ]


isActivePage : Model -> String -> Bool
isActivePage model linkStr =
    model.route == getRoute linkStr
