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
            , section [ class "pl3 w-100" ]
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
        , formBuilder model Gdpr

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
            buttonItem model.newHelpForm.emotionalWellbeing field "Emotional Wellbeing"

        Personal ->
            buttonItem model.newHelpForm.personal field "Personal Development"

        Employment ->
            buttonItem model.newHelpForm.employment field "Employment Support"

        Money ->
            buttonItem model.newHelpForm.money field "Money, Debt and Benefit Advice"

        Volunteering ->
            buttonItem model.newHelpForm.volunteering field "Volunteering and Mentoring"

        Meeting ->
            buttonItem model.newHelpForm.meeting field "Meeting Others"

        MoreInfo ->
            textAreaInput model.newHelpForm.moreInfo field

        Gdpr ->
            buttonItemGDPR model.newHelpForm.gdpr
                field
                "Lancashire Women's Centres (LWC) want you to understand how our service works and how we store your data. Please state that you have read and agree to these terms before you continue"
                "https://womenscentre.org/terms-conditions"



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



--Make Checkbox inputs


buttonItem : Bool -> FormField -> String -> Html Types.Msg
buttonItem state field textValue =
    div [ class "pa2 flex" ]
        [ button [ type_ "button", class " tr bn bg-white items-start", onClick <| SetField field "" ]
            [ div [ class "ma0 pa0 h1 w1 ba bw1 b--purple br1 dib v-mid", classList [ ( "bg-purple", state ) ] ] []
            , p [ class "ma0 pa0 purple f5  lh-copy ph2 v-mid dib" ] [ text textValue ]
            ]
        ]


buttonItemGDPR : Bool -> FormField -> String -> String -> Html Types.Msg
buttonItemGDPR state field textValue url =
    div [ class "pa2 flex" ]
        [ a
            [ href url ]
            [ text url ]
        , button [ type_ "button", class " tr bn bg-white", onClick <| SetField field "" ]
            [ div [ class "ma0 pa0 h1 w1 ba bw1 b--purple br1 dib v-mid", classList [ ( "bg-purple", state ) ] ] []
            , p [ class "ma0 pa0 purple f5  lh-copy ph2 v-mid dib" ] [ text textValue ]
            ]
        ]



--Checks for errors, makes HTML and Bool if they are there


formErrors : String -> List ValError -> ( Html msg, Bool )
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



--Makes text area input


textAreaInput : String -> FormField -> Html Msg
textAreaInput val field =
    div []
        [ div [ class "ba br1 flex w-100 flex-wrap pa1 b--silver mt3" ]
            [ div [ class "purple fw1 pb2" ] [ text "Is there anything else you would like to tell us?" ]
            , textarea
                [ class "sans-serif w-100 mh3 h4 f5 gray fw1 bn"
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

        FailureServer ->
            div [ class "tc pt2 w-100 red" ] [ text "Sorry, something went wrong with our server. You might have to call us, or try again later." ]

        _ ->
            div [] []


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
