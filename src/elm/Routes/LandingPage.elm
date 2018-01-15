module Routes.LandingPage exposing (..)

import Components.WhiteButton exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


landingPage : Model -> Html Msg
landingPage model =
    div [ class "hands" ]
        [ div [ class "purple-background w-100 h-100 " ]
            [ div [ class "white b f2 tc pl3 pr3 pt5 tracked" ]
                [ text "We are here to help." ]
            , div [ class "white-line pb4" ] []
            , whiteButton ( "SEE REAL STORIES", "quotes" )
            , whiteButton ( "SEE OUR SERVICES", "services" )
            , whiteButton ( "CONTACT US", "talk-to-us" )
            ]
        ]
