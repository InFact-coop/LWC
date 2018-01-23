module Routes.FormPage exposing (..)

import Components.Buttons exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


formPage : Model -> Html Msg
formPage model =
    div [ class "ma4" ]
        [ div [ class "b gray f3 mb3", id "whole-page" ]
            [ text "Your details" ]
        , div
            [ class "gray fw1 mb4" ]
            [ text "So we can get in touch with you we just need a few details" ]
        , div
            [ class "purple-line fl pl3 mb4" ]
            []
        , detailsForm model
        , clearWhiteButton "Back" "talk-to-us"
        ]


detailsForm : Model -> Html Msg
detailsForm model =
    Html.form [ onSubmit SendHelpForm, class " w-50-l m0-auto" ]
        [ formInput model "Name" "text" model.newHelpForm.name ChangeFormName wrapperClass_text_top errClass_text titleClass_text inputClass_text
        , formInput model "Date Of Birth" "date" model.newHelpForm.dob ChangeFormDOB wrapperClass_text errClass_text titleClass_text inputClass_text
        , formInput model "Contact Number" "text" model.newHelpForm.contactNumber ChangeFormNumber wrapperClass_text errClass_text titleClass_text inputClass_text
        , formInput model "Email" "text" model.newHelpForm.email ChangeFormEmail wrapperClass_text errClass_text titleClass_text inputClass_text
        , formInput model "Postcode" "text" model.newHelpForm.postcode ChangeFormPostcode wrapperClass_text errClass_text titleClass_text inputClass_text

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
            [ div [ class "purple fw1 pb2" ] [ text "Is there anything else you would like to tell us?" ]
            , textarea
                [ class "sans-serif w-100 mh3 h4 f5 gray fw1 bn"
                , name "additionalInfo"
                , attribute "rows" "5"
                , placeholder "Please let us know here"
                , value model.newHelpForm.moreInfo
                , onInput (ChangeFormMore model.newHelpForm)
                ]
                []
            ]
        , buttonItem model.newHelpForm.gdpr (CheckboxGDPR model.newHelpForm) "Please check here to consent to LOREM IPSUM"

        -- same as before
        , div [ class "tc" ]
            [ button
                [ type_ "submit"
                , class "pointer f5 ba br1 w-80 w-40-l br2 pa3 tc bg-purple white mt3 br1 dim"
                , classList [ ( "bg-light-purple", not model.newHelpForm.gdpr ) ]
                , disabled <| not model.newHelpForm.gdpr
                ]
                [ text "Submit" ]
            ]
        , sendingMsg model.formSent
        ]


formInput model fieldName fieldType fieldValue msg wrapperClass errClass titleClass inputClass =
    let
        ( errHtml, errExists ) =
            formErrors fieldName model.validationErrors
    in
    div []
        [ div [ class wrapperClass, classList [ ( errClass, errExists ) ] ]
            [ div [ class titleClass ] [ text fieldName ]
            , label [ for fieldName ]
                []
            , input
                [ value fieldValue
                , type_ fieldType
                , class inputClass
                , onInput (msg model.newHelpForm)
                , name fieldName
                ]
                []
            ]
        , errHtml
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


type alias FormField =
    String


formErrors : FormField -> List ValError -> ( Html msg, Bool )
formErrors field errors =
    ( errors
        |> List.filter (\error -> error.field == field)
        |> List.map (\error -> div [] (List.map (\errMess -> div [ class "purple f5" ] [ text errMess ]) error.messages))
        |> div []
    , errors
        |> List.filter (\error -> error.field == field)
        |> List.isEmpty
        |> not
    )


wrapperClass_text_top =
    "ba br1 flex w-100 flex-wrap pa1 b--silver"


wrapperClass_text =
    "ba br1 flex w-100 flex-wrap pa1 b--silver mt3"


errClass_text =
    "b--purple bw2"


titleClass_text =
    "purple fw1"


inputClass_text =
    "w-100 f4 gray fw1 bn"
