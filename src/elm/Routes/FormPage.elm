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
        , Html.form [ onSubmit SendHelpForm, class "mt5" ]
            [ div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver" ]
                [ div [ class "purple fw1" ] [ text "Name" ]
                , input [ value model.newHelpForm.name, type_ "text", class "w-100 f4 gray fw1 bn", onInput (ChangeFormName model.newHelpForm) ] []
                ]
            , div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver mt3" ]
                [ div [ class "purple fw1" ] [ text "Date of Birth" ]
                , input [ value model.newHelpForm.dob, type_ "date", class "w-100 f4 gray fw1 bn", onInput (ChangeFormDOB model.newHelpForm) ] []
                ]
            , div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver mt3" ]
                [ div [ class "purple fw1" ] [ text "Contact Number" ]
                , input [ value model.newHelpForm.contactNumber, type_ "text", class "w-100 f4 gray fw1 bn", onInput (ChangeFormNumber model.newHelpForm) ] []
                ]
            , div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver mt3" ]
                [ div [ class "purple fw1" ] [ text "Email" ]
                , input [ value model.newHelpForm.email, type_ "text", class "w-100 f4 gray fw1 bn", onInput (ChangeFormEmail model.newHelpForm) ] []
                ]
            , div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver mt3" ]
                [ div [ class "purple fw1" ] [ text "Postcode" ]
                , input [ value model.newHelpForm.postcode, type_ "text", class "w-100 f4 gray fw1 bn", onInput (ChangeFormPostcode model.newHelpForm) ] []
                ]
            , div [ class "" ]
                [ button [ type_ "submit", class "pointer f5 ba br1 w-100 pa3 tc bg-purple white mt3 br1 dim" ] [ text "Submit" ]
                ]
            , sendingMsg model.formSent
            ]
        , clearWhiteButton "Back" "talk-to-us"
        ]


sendingMsg : Maybe FormSent -> Html Msg
sendingMsg status =
    case status of
        Just Success ->
            div [ class "tc pt2 w-100 green" ] [ text "Your data was sent successfully" ]

        Just Pending ->
            div [ class "tc pt2 w-100 grey" ] [ text "Sending Data..." ]

        Just Failure ->
            div [ class "tc pt2 w-100 red" ] [ text "Your data failed to send" ]

        Nothing ->
            div [] []
