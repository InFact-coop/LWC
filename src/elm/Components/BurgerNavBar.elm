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
    div [ class "dn-l " ]
        [ a [ href "/#", class "ml4" ] [ img [ src "./assets/logo.jpg", class "h3" ] [] ]
        , img [ src "./assets/burger.png", class "fr ma3", onClick ToggleBurgerMenu ] []
        ]


burgerNavBarHidden : Html Msg
burgerNavBarHidden =
    div [ class "dn-l bb b--purple" ] <|
        [ a [ href "/#", class "ml4" ] [ img [ src "./assets/logo.jpg", class "h3" ] [] ]
        , img [ src "./assets/purplecross.png", class "fr ma3", onClick ToggleBurgerMenu ] []
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
