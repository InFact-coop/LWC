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
            [ class "purple-line fl pl3 mb4" ]
            []
        , Html.form [ onSubmit SendHelpForm, class " w-50-l m0-auto" ]
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

            -- New input fields
            , div [ class "pt4 pb3" ] [ text "The following questions are optional, but they are really helpful for us to put you in touch with the right person." ]

            -- choice of services
            , div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver  pb3 pt1" ]
                [ h4 [ class "purple fw1 mt1 w-100" ] [ text "Which services are you interested in?" ]
                , section [ class "pl3" ]
                    [ -- emotional wellbeing
                      div [ class "w-100 mb1" ]
                        [ input [ type_ "checkbox", class "w-100 f4 gray fw1 bn w-auto", id "emotionalWellbeing", name "services" ] []
                        , label [ for "emotionalWellbeing", class "" ] [ text "Emotional Wellbeing" ]
                        ]

                    -- Personal Development
                    , div [ class "w-100 mb1" ]
                        [ input [ type_ "checkbox", class "w-100 f4 gray fw1 bn w-auto", id "personalDevelopment", name "development" ] []
                        , label [ for "personalDevelopment", class "" ] [ text "Personal Development" ]
                        ]

                    -- Employment Support
                    , div [ class "w-100 mb1" ]
                        [ input [ type_ "checkbox", class "w-100 f4 gray fw1 bn w-auto", id "employmentSupport", name "employment" ] []
                        , label [ for "employmentSupport", class "" ] [ text "Employment Support" ]
                        ]

                    -- Money Debt and benefit
                    , div [ class "w-100 mb1" ]
                        [ input [ type_ "checkbox", class "w-100 f4 gray fw1 bn w-auto", id "moneyDebtBenefit", name "money" ] []
                        , label [ for "moneyDebtBenefit", class "" ] [ text "Money, Debt and Benefit Advice" ]
                        ]

                    -- Volunteering and mentoring
                    , div [ class "w-100 mb1" ]
                        [ input [ type_ "checkbox", class "w-100 f4 gray fw1 bn w-auto", id "volunteeringMentoring", name "volunteering" ] []
                        , label [ for "volunteeringMentoring", class "" ] [ text "Volunteering and Mentoring" ]
                        ]

                    -- Meeting Others
                    , div [ class "w-100 mb1" ]
                        [ input [ type_ "checkbox", class "w-100 f4 gray fw1 bn w-auto", id "meetingOthers", name "meeting" ] []
                        , label [ for "meetingOthers", class "" ] [ text "Meeting Others" ]
                        ]
                    ]
                ]

            -- Additional information
            , div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver mt3" ]
                [ div [ class "purple fw1" ] [ text "Is there anything else you would like to tell us?" ]
                , textarea [ class "w-100 mh3 h4 f4 gray fw1 bn", name "additionalInfo", attribute "rows" "5", placeholder "Please let us know here" ] []
                ]

            -- same as before
            , div [ class "tc" ]
                [ button [ type_ "submit", class "pointer f5 ba br1 w-80 w-40-l br2 pa3 tc bg-purple white mt3 br1 dim" ] [ text "Submit" ]
                ]
            , sendingMsg model.formSent
            ]
        , clearWhiteButton "Back" "talk-to-us"
        ]


sendingMsg : FormSent -> Html Msg
sendingMsg status =
    case status of
        Success ->
            div [ class "tc pt2 w-100 green" ] [ text "Your data was sent successfully" ]

        Pending ->
            div [ class "tc pt2 w-100 grey" ] [ text "Sending Data..." ]

        Failure ->
            div [ class "tc pt2 w-100 red" ] [ text "Your data failed to send" ]

        NotSent ->
            div [] []
