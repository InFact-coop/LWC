module Routes.DetailedQuotePage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Components.TestimonialSection exposing (..)


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
    section [ class "action-buttons center w-90" ]
        [ div []
            [ h3 [ class "db mv3" ] [ text "Sounds like you?" ]
            , a [ class "db bg-purple br2 pa3 tc m0 dim white" ] [ text "Talk to us" ]
            ]
        , div []
            [ h3 [ class "db mb3 mt4" ] [ text "Still not sure?" ]
            , a [ class "db relative bg-purple br2 pa3 tc ma0 dim white" ] [ text "See more stories" ]
            ]
        , a [ class "db bg-light-purple br2 pa3 tc ma0 mt2 dim white" ] [ text "See full list of services" ]
        ]
