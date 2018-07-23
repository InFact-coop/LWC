module Routes.QuotesPage exposing (..)

import Components.Buttons exposing (..)
import Components.QuotesListItem exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Utils exposing (..)


quotesPage : Model -> Html Msg
quotesPage model =
    div [ class "" ]
        [ div [ class "mh5-ns" ]
            [ div [ class <| routeToColour model.route ++ " f2 b ma4 heading ttu" ] [ text "Real Stories" ]
            , div [ class "gray fw1 ma4 w-50-l" ]
                [ text "Knowing where to start can feel overwhelming sometimes. We want to help find the best service for you. Below are some examples of women who we’ve recently helped. To see what services they used click on find out more. "
                , div [ class "mt2" ] []
                , text "These stories are real but we've changed the names and images to respect people's identities"
                ]
            , div
                [ class "black-line ma4" ]
                []
            , ul [ class "pa3" ]
                (List.map
                    quotesListItem
                    model.quotes
                )
            , blackButton "Our services" "services"
            , blackButton "Contact us" "talk-to-us"
            ]
        ]
