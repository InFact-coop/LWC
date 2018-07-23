module Components.BurgerNavBar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import State exposing (getRoute)
import Types exposing (..)


burgerNavBar : Model -> Html Msg
burgerNavBar model =
    if model.burgerVisible == True then
        burgerNavBarVisible
    else
        burgerNavBarHidden


burgerNavBarVisible : Html Msg
burgerNavBarVisible =
    div [ class "dn-l ph3" ]
        [ div [ class "flex items-center justify-between" ]
            [ a [ href "/#", class "no-underline" ] [ h1 [ class "heading black f3 ttu mw5 mv2 dib" ] [ text "Lancashire Women" ] ]
            , img [ src "./assets/burger.png", class "fr", onClick ToggleBurgerMenu ] []
            ]
        ]


burgerNavBarHidden : Html Msg
burgerNavBarHidden =
    div [ class "dn-l bb b--black ph3" ] <|
        [ div [ class "flex items-center justify-between" ]
            [ a [ href "/#", class "no-underline" ] [ h1 [ class "heading black f3 ttu mw5 mv2 dib" ] [ text "Lancashire Women" ] ]
            , img [ src "./assets/blackcross.svg", class "fr", onClick ToggleBurgerMenu ] []
            ]
        ]
            ++ navbarContent


navbarLink : ( String, String ) -> Html Msg
navbarLink ( name, route ) =
    ul [ class "list" ]
        [ li [ class "gray tr pr4 pb2 f3" ]
            [ a [ href ("/#" ++ route), class "gray no-underline" ] [ text name ]
            ]
        ]


navbarContent : List (Html Msg)
navbarContent =
    List.map navbarLink
        [ ( "Home", "landing" )
        , ( "Real Stories", "quotes" )
        , ( "Our Services", "services" )
        , ( "Contact Us", "talk-to-us" )
        ]
