module Routes.DetailedQuotePage exposing (..)

import Components.Buttons exposing (..)
import Components.TestimonialSection exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


detailedQuotePage : Model -> Html Msg
detailedQuotePage model =
    div [ class "ma4 ml5-ns mr5-ns" ]
        [ div [ class "gray f3 b" ] [ text "Women like you" ]
        , div [ class "gray fw1 mt3 mb3 mb4-ns w-50-l" ] [ text "Below is a real story from someone we've helped. We provide all the services that they used. If you think something they've used would help you as well or if you're still not sure please get in touch with us." ]
        , div [ class "purple-line mb4" ] []
        , retrieveTestimonial model
        , div [ class "dn-ns" ] [ purpleButton "See full list of services" "services" ]
        , div [ class "dn-ns" ] [ purpleButton "Contact us" "talk-to-us" ]
        , clearWhiteButton "Back to stories" "quotes"
        ]
