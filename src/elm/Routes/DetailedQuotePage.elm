module Routes.DetailedQuotePage exposing (..)

import Components.Buttons exposing (..)
import Components.TestimonialSection exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


detailedQuotePage : Model -> Html Msg
detailedQuotePage model =
    div [ class "mb4" ]
        [ header [ class "header pl3" ]
            [ h1 [ class "tl f3 fw7 gray mb1" ] [ text "Women like you" ]
            ]
        , retrieveTestimonial model
        , purpleButton ( "See full list of services", "services" )
        , purpleButton ( "Contact us", "talk-to-us" )
        , clearWhiteButton ( "Back to stories", "quotes" )
        ]
