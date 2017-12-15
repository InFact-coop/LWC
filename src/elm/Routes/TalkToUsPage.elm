module Routes.TalkToUsPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


talkToUsPage : Model -> Html Msg
talkToUsPage model =
    div [ class "ma4" ]
        [ div [ class "gray f3 b" ] [ text "Talk to us" ]
        , div [ class "gray fw1 mt3 mb3" ] [ text "Whether you know what you service you need and want to book an appointment or need more advice there are a three ways to get in touch. " ]
        , div [ class "purple-line" ] []
        , div [ class "tc mt3 bb b--silver pb3" ]
            [ div [ class " purple f3" ] [ text "Come to a centre" ]
            , div [ class "mt3 mb3" ]
                [ text "See a list of our centres "
                , a
                    [ class "no-underline b purple", href "http://womenscentre.org/who-we-are/our-centres" ]
                    [ text "here" ]
                ]
            , img [ src "./assets/centre.png" ] []
            ]
        , div [ class "tc mt3 bb b--silver pb3" ]
            [ div [ class " purple f3" ] [ text "Call us" ]
            , div [ class "mt3 mb3" ]
                [ text "0808 280 3160" ]
            , img [ src "./assets/phone.png" ] []
            ]
        , div [ class "tc mt3 bb b--silver pb3" ]
            [ div [ class " purple f3" ] [ text "We'll contact you" ]
            , div [ class "mt3 mb3" ]
                [ text "Click "
                , a
                    [ href "#form", class "purple b no-underline" ]
                    [ text "here" ]
                , text " to fill in a short form"
                ]
            , img [ src "./assets/person.png" ] []
            ]
        , div [ class "bg-white ba b--purple tc pa3 mt4" ]
            [ a [ href "#services", class "purple no-underline" ] [ text "Back" ]
            ]
        ]
