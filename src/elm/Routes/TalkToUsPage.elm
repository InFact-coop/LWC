module Routes.TalkToUsPage exposing (..)

import Components.Buttons exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


talkToUsPage : Model -> Html Msg
talkToUsPage model =
    div [ class "ma4 ml5-ns" ]
        [ div [ class "gray f3 b" ] [ text "Talk to us" ]
        , div [ class "gray fw1 mt3 mb3 mb4-ns w-50-l" ] [ text "Whether you know what you service you need and want to book an appointment or need more advice there are a three ways to get in touch. " ]
        , div [ class "purple-line mb3" ] []
        , a [ href "http://womenscentre.org/who-we-are/our-centres", class "tc db black mb3-l" ]
            [ div [ class "tc mt3 ba b--purple w-50-l w-100 dib pt3 pb3" ]
                [ div [ class " purple f3" ] [ text "Come to a centre" ]
                , div [ class "mt3 mb3" ]
                    [ text "Click to see a list of our centres" ]
                , img [ src "./assets/centre.png" ] []
                ]
            ]
        , div [ class "tc mt3 bb b--silver pb3 dn-l" ] []
        , a [ href "#form", class "tc db black mb3-l" ]
            [ div [ class "tc mt3 ba b--purple w-50-l w-100 dib pt3 pb3" ]
                [ div [ class " purple f3" ] [ text "We'll contact you" ]
                , div [ class "mt3 mb3" ]
                    [ text "Click to fill in a short form" ]
                , img [ src "./assets/person.png" ] []
                ]
            ]
        , div [ class "tc mt3 bb b--silver pb3 dn-l" ] []
        , a [ class "tc db  black mb3-l" ]
            [ div [ class "tc mt3 ba b--purple w-50-l w-100 dib pt3 pb3" ]
                [ div [ class " purple f3" ] [ text "Call us" ]
                , div [ class "mt3 mb3" ]
                    [ text "Freephone: 0808 280 3160" ]
                , img [ src "./assets/phone.png" ] []
                ]
            ]
        , div [ class "dn-l" ] [ clearWhiteButton "Home" "landing" ]
        ]
