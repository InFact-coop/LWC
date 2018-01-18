module Routes.FormPage exposing (..)

import Components.Buttons exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


formPage : Model -> Html Msg
formPage model =
    div [ class "ma4" ]
        [ div [ class "b gray f3 mb3" ]
            [ text "Your details" ]
        , div
            [ class "gray fw1 mb4" ]
            [ text "So we can get in touch with you we just need a few details" ]
        , div
            [ class "purple-line fl pl3" ]
            []
        , div [ class "mt5" ]
            [ div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver" ]
                [ div [ class "purple fw1" ] [ text "Name" ]
                , input [ type_ "text", class "w-100 f4 gray fw1 bn" ] []
                ]
            , div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver mt3" ]
                [ div [ class "purple fw1" ] [ text "Date of Birth" ]
                , input [ type_ "date", class "w-100 f4 gray fw1 bn" ] []
                ]
            , div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver mt3" ]
                [ div [ class "purple fw1" ] [ text "Contact Number" ]
                , input [ type_ "text", class "w-100 f4 gray fw1 bn" ] []
                ]
            , div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver mt3" ]
                [ div [ class "purple fw1" ] [ text "Email" ]
                , input [ type_ "text", class "w-100 f4 gray fw1 bn" ] []
                ]
            , div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver mt3" ]
                [ div [ class "purple fw1" ] [ text "Postcode" ]
                , input [ type_ "text", class "w-100 f4 gray fw1 bn" ] []
                ]
            ]
        , purpleButton "Submit" "thank-you"
        , clearWhiteButton "Back" "talk-to-us"
        ]
