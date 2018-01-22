module Commands exposing (..)

import Http exposing (..)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode as Encode
import Types exposing (..)


formResponseDecoder : Decode.Decoder FormResponse
formResponseDecoder =
    decode FormResponse
        |> required "success" Decode.bool


areas : Model -> List ( String, Bool )
areas model =
    [ ( "Emotional Wellbeing"
      , model.newHelpForm.emotionalWellbeing
      )
    , ( "Personal Development"
      , model.newHelpForm.personal
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
            , ( "GDPR", Encode.bool model.newHelpForm.gdpr )
            ]

        areasList =
            areasEncoder <| areas model
    in
    Encode.object attributes


baseUrl : String
baseUrl =
    "https://lwcapp.herokuapp.com/api/v1/help_form"


methodRequest : String -> String -> Encode.Value -> Decode.Decoder a -> Http.Request a
methodRequest method url encodedBody decoder =
    Http.request
        { body = encodedBody |> Http.jsonBody
        , expect = Http.expectJson decoder
        , headers = []
        , method = method
        , timeout = Nothing
        , url = url
        , withCredentials = False
        }


postFormRequest : Model -> Http.Request FormResponse
postFormRequest model =
    methodRequest "POST" baseUrl (helpFormEncoder model) formResponseDecoder


sendFormCmd : Model -> Cmd Msg
sendFormCmd model =
    postFormRequest model
        |> Http.send OnFormSent
