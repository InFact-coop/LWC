module Components.Form exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


--Form itself


detailsForm : Model -> Html Msg
detailsForm model =
    Html.form [ onSubmit SendHelpForm, class " w-50-l m0-auto" ]
        [ formBuilder model Name
        , formBuilder model Dob
        , formBuilder model ContactNumber
        , formBuilder model Email
        , formBuilder model Postcode

        -- New input fields
        , div [ class "pt4 pb3" ] [ text "The following questions are optional, but they are really helpful for us to put you in touch with the right person." ]

        -- choice of services
        , div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver  pb3 pt1" ]
            [ h4 [ class "purple fw1 mt1 w-100" ] [ text "Which services are you interested in?" ]
            , section [ class "pl3-ns pl0 w-100" ]
                [ formBuilder model EmotionalWellbeing
                , formBuilder model Personal
                , formBuilder model Employment
                , formBuilder model Money
                , formBuilder model Volunteering
                , formBuilder model Meeting
                ]
            ]

        -- Additional information
        , formBuilder model MoreInfo

        -- Legal Stuff
        , div [ class "pa2-ns pa1 mt3 fw2" ]
            [ div []
                [ text "Lancashire Women's Centres (LWC) want you to understand how our service works and how we store your data. Please state that you have read and agree to these terms before you continue"
                ]
            , a
                [ href "https://womenscentre.org/terms-conditions"
                , target "blank"
                ]
                [ text "https://womenscentre.org/terms-conditions" ]
            ]
        , formBuilder model Gdpr
        , div [ class "pa2-ns pa1 fw2 " ] [ div [ class "di" ] [ text "LWC like to keep in touch with people to tell you about the vital work we do, our fundraising events and opportunities to support or work for us." ] ]
        , formBuilder model ContactMe

        -- same as before
        , div [ class "tc" ]
            [ button
                [ type_ "submit"
                , class "f5 ba br1 w-80 w-40-l br2 pa3 tc bg-purple white mt3 br1"
                , classList
                    [ ( "bg-light-purple", not model.newHelpForm.gdpr )
                    , ( "pointer", model.newHelpForm.gdpr )
                    ]
                ]
                [ text "Submit" ]
            ]
        , sendingMsg model.formSent
        ]



-- Builds form inputs based on field type


formBuilder : Model -> FormField -> Html Msg
formBuilder model field =
    case field of
        Name ->
            basicInput field "Name" "text" model.newHelpForm.name model.validationErrors wrapperClass_text_top errClass_text titleClass_text inputClass_text

        Dob ->
            basicInput field "Date Of Birth" "date" model.newHelpForm.dob model.validationErrors wrapperClass_text errClass_text titleClass_text inputClass_text

        ContactNumber ->
            basicInput field "Contact Number" "text" model.newHelpForm.contactNumber model.validationErrors wrapperClass_text errClass_text titleClass_text inputClass_text

        Email ->
            basicInput field "Email" "text" model.newHelpForm.email model.validationErrors wrapperClass_text errClass_text titleClass_text inputClass_text

        Postcode ->
            basicInput field "Postcode" "text" model.newHelpForm.postcode model.validationErrors wrapperClass_text errClass_text titleClass_text inputClass_text

        EmotionalWellbeing ->
            buttonItem model.newHelpForm.emotionalWellbeing field "Emotional Wellbeing" "gray"

        Personal ->
            buttonItem model.newHelpForm.personal field "Personal Development" "gray"

        Employment ->
            buttonItem model.newHelpForm.employment field "Employment Support" "gray"

        Money ->
            buttonItem model.newHelpForm.money field "Money, Debt and Benefit Advice" "gray"

        Volunteering ->
            buttonItem model.newHelpForm.volunteering field "Volunteering and Mentoring" "gray"

        Meeting ->
            buttonItem model.newHelpForm.meeting field "Meeting Others" "gray"

        MoreInfo ->
            textAreaInput model.newHelpForm.moreInfo field

        Gdpr ->
            let
                colour =
                    if model.formSent == FailureGDPR then
                        "red"
                    else
                        "gray"
            in
            buttonItem model.newHelpForm.gdpr field "I agree to the data storage terms" colour

        ContactMe ->
            buttonItem model.newHelpForm.contactMe field "Would you like to join our mailing list?" "gray"



-- Build a basic (takes strings) input


basicInput : FormField -> String -> String -> String -> List ValError -> String -> String -> String -> String -> Html Msg
basicInput field fieldName fieldType fieldValue errors wrapperClass errClass titleClass inputClass =
    let
        ( errHtml, errExists ) =
            formErrors fieldName errors
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
                , onInput <| SetField field
                , name fieldName
                ]
                []
            ]
        , errHtml
        ]


buttonItem : Bool -> FormField -> String -> String -> Html Types.Msg
buttonItem state field textValue textColour =
    div [ class "pa2 flex" ]
        [ button [ type_ "button", class "tl bn bg-white items-start ", onClick <| SetField field "" ]
            [ div [ class "ma0 pa0 h1 w1 ba b--gray br2 dib v-mid", classList [ ( "purple-tick bn", state ) ] ] []
            , p [ class <| "ma0 pa0 f5 lh-copy ph2 v-mid di " ++ textColour ] [ text textValue ]
            ]
        ]



--Checks for errors, makes HTML and Bool if they are there


formErrors : String -> List ValError -> ( Html msg, Bool )
formErrors field errors =
    ( errors
        |> List.filter (\error -> error.field == field)
        |> List.map (\error -> div [] (List.map (\errMess -> div [ class "red f6 f5-ns fw1" ] [ text errMess ]) error.messages))
        |> div []
    , errors
        |> List.filter (\error -> error.field == field)
        |> List.isEmpty
        |> not
    )



--Makes text area input


textAreaInput : String -> FormField -> Html Msg
textAreaInput val field =
    div []
        [ div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver mt3" ]
            [ div [ class "purple fw1 pb2" ] [ text "Is there anything else you would like to tell us?" ]
            , textarea
                [ class "sans-serif w-100 ma3-ns ma1 h4 f5 pa1 pa2-ns gray fw1 ba-ns b--moon-gray br2"
                , name "additionalInfo"
                , attribute "rows" "5"
                , placeholder "Please let us know here"
                , value val
                , onInput <| SetField field
                ]
                []
            ]
        ]



--Make Sending status html


sendingMsg : FormSent -> Html Msg
sendingMsg status =
    case status of
        Pending ->
            div [ class "tc pt2 w-100 grey" ] [ text "Sending Data..." ]

        FailureValidation ->
            div [ class "tc pt2 w-100 purple" ] [ text "Sorry, some of the data you've sent isn't quite right, see above" ]

        FailureGDPR ->
            div [ class "tc pt2 w-100 purple" ] [ text "Please agree to the storage terms to submit your data" ]

        FailureServer ->
            div [ class "tc pt2 w-100 red" ] [ text "Sorry, something went wrong with our server. You might have to call us, or try again later." ]

        _ ->
            div [] []


wrapperClass_text_top =
    "ba br1 flex w-100 flex-wrap pa1 b--silver"


wrapperClass_text =
    "ba br1 flex w-100 flex-wrap pa1 b--silver mt3"


errClass_text =
    "b--red"


titleClass_text =
    "purple fw1"


inputClass_text =
    "w-100 f4 gray fw1 bn"
