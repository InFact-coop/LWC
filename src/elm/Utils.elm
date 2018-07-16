module Utils exposing (..)

import Http exposing (..)
import Json.Decode as Decode
import Json.Encode as Encode


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
