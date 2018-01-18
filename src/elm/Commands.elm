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


helpFormEncoder : HelpForm -> Encode.Value
helpFormEncoder helpForm =
    let
        attributes =
            [ ( "Name", Encode.string helpForm.name )
            , ( "DOB", Encode.string helpForm.dob )
            , ( "Contact Number", Encode.string helpForm.contactNumber )
            , ( "Email", Encode.string helpForm.email )
            , ( "Postcode", Encode.string helpForm.postcode )
            ]
    in
    Encode.object attributes


baseUrl : String
baseUrl =
    "https://lwcapp.herokuapp.com/api/v1/help_form"



-- "http://localhost:4000/api/v1/help_form"


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


postFormRequest : HelpForm -> Http.Request FormResponse
postFormRequest helpForm =
    methodRequest "POST" baseUrl (helpFormEncoder helpForm) formResponseDecoder


sendFormCmd : HelpForm -> Cmd Msg
sendFormCmd helpForm =
    postFormRequest helpForm
        |> Http.send OnFormSent
