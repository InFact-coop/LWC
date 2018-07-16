module Commands exposing (..)

import Http exposing (..)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode as Encode
import Utils exposing (..)
import Types exposing (..)


formResponseDecoder : Decode.Decoder FormResponse
formResponseDecoder =
    decode FormResponse
        |> required "success" Decode.bool


areas : Model -> List ( String, Bool )
areas model =
    [ ( "Therapy"
      , model.newHelpForm.therapy
      )
    , ( "Courses & Wellbeing"
      , model.newHelpForm.courses
      )
    , ( "Employment Support"
      , model.newHelpForm.employment
      )
    , ( "Money, Debt and Benefit Advice"
      , model.newHelpForm.money
      )
    , ( "Volunteering and Mentoring"
      , model.newHelpForm.volunteering
      )
    , ( "Meeting Others"
      , model.newHelpForm.meeting
      )
    ]


areasEncoder : List ( String, Bool ) -> List Encode.Value
areasEncoder areas =
    areas
        |> List.filter (\( name, state ) -> state)
        |> List.map (\( name, state ) -> Encode.string name)


helpFormEncoder : Model -> Encode.Value
helpFormEncoder model =
    let
        attributes =
            [ ( "Name", Encode.string model.newHelpForm.name )
            , ( "DOB", Encode.string model.newHelpForm.dob )
            , ( "Contact Number", Encode.string model.newHelpForm.contactNumber )
            , ( "Email", Encode.string model.newHelpForm.email )
            , ( "Postcode", Encode.string model.newHelpForm.postcode )
            , ( "Areas of Interest", Encode.list areasList )
            , ( "More Info", Encode.string model.newHelpForm.moreInfo )
            , ( "GDPR", Encode.bool model.newHelpForm.gdpr )
            , ( "Add To Mailing List", Encode.bool model.newHelpForm.contactMe )
            ]

        areasList =
            areasEncoder <| areas model
    in
        Encode.object attributes


baseUrl : String
baseUrl =
    "https://womenscentre.herokuapp.com/api/v1/help_form"



-- "http://localhost:4000/api/v1/help_form"


postFormRequest : Model -> Http.Request FormResponse
postFormRequest model =
    methodRequest "POST" baseUrl (helpFormEncoder model) formResponseDecoder


sendFormCmd : Model -> Cmd Msg
sendFormCmd model =
    postFormRequest model
        |> Http.send OnFormSent


validationResponseDecoder : Decode.Decoder (List ValError)
validationResponseDecoder =
    decode ValError
        |> required "field" Decode.string
        |> required "messages" (Decode.list Decode.string)
        |> Decode.list
