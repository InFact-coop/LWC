module Requests.Services exposing (..)

import Http exposing (..)
import Html exposing (..)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, hardcoded)
import Types exposing (..)


serviceDecoder : Decode.Decoder Service
serviceDecoder =
    decode Service
        |> required "id" Decode.string
        |> required "Service Name" Decode.string
        |> hardcoded False
        |> required "Paragraph 1" htmlMsgDecoder


htmlMsgDecoder : Decode.Decoder (Html Msg)
htmlMsgDecoder =
    Decode.string
        |> Decode.andThen stringToHtmlMsg


stringToHtmlMsg : String -> Decode.Decoder (Html Msg)
stringToHtmlMsg str =
    Decode.succeed <| div [] [ text str ]


servicesDecoder : Decode.Decoder (List Service)
servicesDecoder =
    Decode.list serviceDecoder


fetchServices : Cmd Msg
fetchServices =
    Http.get servicesUrl servicesDecoder
        |> Http.send OnFetchServices


servicesUrl : String
servicesUrl =
    "http://localhost:4000/api/v1/services"
