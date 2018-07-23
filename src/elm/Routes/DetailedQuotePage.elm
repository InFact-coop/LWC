module Routes.DetailedQuotePage exposing (..)

import Components.Buttons exposing (..)
import Components.TestimonialSection exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Utils exposing (routeToColour)


detailedQuotePage : Model -> Html Msg
detailedQuotePage model =
    div [ class "mh5-ns" ]
        [ div [ class <| routeToColour model.route ++ " f2 b ma4 heading ttu" ] [ text "Real Stories" ]
        , div [ class "gray fw1 mv3 mb4-ns w-50-l mh4" ]
            [ text "Below is a real story from someone we've helped. We provide all the services that they used. If you think something they've used would help you as well or if you're still not sure please get in touch with us."
            , div [ class "mt2 mh4" ] []
            , text "These stories are real but we've changed the names and images to respect people's identities"
            ]
        , div [ class "black-line mb4 mh4" ] []
        , retrieveTestimonial model
        , div [ class "dn-l" ] [ blackButton "See our services" "services" ]
        , div [ class "dn-l" ] [ blackButton "Contact us" "talk-to-us" ]
        , clearWhiteButton "Back to stories" "quotes"
        ]
