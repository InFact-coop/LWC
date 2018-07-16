module Requests.Services exposing (..)

import Http exposing (..)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Types exposing (..)


serviceDecoder : Decode.Decoder Service
serviceDecoder =
    decode Service
        |> required "id" Decode.string
        |> required "Name" Decode.string
        |> required "Age" Decode.string
        |> required "Image source" Decode.string
        |> required "Therapy" Decode.string
        |> required "Short " Decode.string
        |> required "Long  Part One" Decode.string
        |> required "Long  Part Two" Decode.string


servicesDecoder : Decode.Decoder (List Service)
servicesDecoder =
    Decode.list serviceDecoder


fetchServices : Cmd Msg
fetchServices =
    Http.get servicesUrl servicesDecoder
        |> Http.send OnFetchServices


servicesUrl : String
servicesUrl =
    "https://womenscentre.herokuapp.com/api/v1/services"
