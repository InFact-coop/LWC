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
        ]
