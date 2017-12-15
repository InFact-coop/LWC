module Routes.DetailedQuotePage exposing (..)

import Components.TestimonialSection exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


detailedQuotePage : Model -> Html Msg
detailedQuotePage model =
    div [ class "" ]
        [ header [ class "header pl3" ]
            [ h1 [ class "tl f3 fw7 gray mb1" ] [ text "Women like you" ]
            ]
        , retrieveTestimonial model
        , actionButtons
        ]


actionButtons : Html Msg
actionButtons =
    section [ class "action-buttons center w-90 mt4" ]
        [ div []
            [ div []
                [ a [ class "db bg-purple br2 pa3 tc ma0 mt2 dim white no-underline mb3", href "#services" ] [ text "See full list of services" ]
                , a [ class "db bg-light-purple br2 pa3 tc m0 dim white no-underline mb3", href "#talk-to-us" ] [ text "Talk to us" ]
                ]
            , a [ class "db relative ba b--purple br2 pa3 tc ma0 dim purple no-underline mb4", href "#quotes" ] [ text "Back to stories" ]
            ]
        ]
