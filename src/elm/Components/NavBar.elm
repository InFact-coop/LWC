module Components.NavBar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


navBar : Model -> Html Msg
navBar model =
    ul [ class "flex ma0 bg-white w-100 pa1 justify-between items-center" ]
        [ li [ class "dib" ]
            [ img [ src "./assets/logo.jpg", class "ml1 h3 w3 v-mid" ] []
            ]
        , li [ class "burger h2 w2 list mr3" ] []
        ]
