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
                , section [ class "pl3 w-100" ]
                    [ -- emotional wellbeing
                      buttonItem model.newHelpForm.emotionalWellbeing
                        (CheckboxEmotion model.newHelpForm)
                        "Emotional Wellbeing"
                    , buttonItem model.newHelpForm.personal
                        (CheckboxPersonal model.newHelpForm)
                        "Personal Development"
                    , buttonItem model.newHelpForm.employment
                        (CheckboxEmployment model.newHelpForm)
                        "Employment Support"
                    , buttonItem model.newHelpForm.money
                        (CheckboxMoney model.newHelpForm)
                        "Money, Debt and Benefit Advice"
                    , buttonItem model.newHelpForm.volunteering
                        (CheckboxVolunteering model.newHelpForm)
                        "Volunteering and Mentoring"
                    , buttonItem model.newHelpForm.meeting
                        (CheckboxMeeting model.newHelpForm)
                        "Meeting Others"
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


buttonItem : Bool -> Types.Msg -> String -> Html Types.Msg
buttonItem state msg textValue =
    div [ class "pa2 flex" ]
        [ button [ type_ "button", class " tr bn bg-white items-start", onClick msg ]
            [ div [ class "ma0 pa0 h1 w1 ba bw1 b--purple br1 dib v-mid", classList [ ( "bg-purple", state ) ] ] []
            , p [ class "ma0 pa0 purple f5  lh-copy ph2 v-mid dib" ] [ text textValue ]
            ]
        ]
