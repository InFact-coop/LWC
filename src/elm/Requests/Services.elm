module Requests.Services exposing (..)

import Http exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, hardcoded)
import Utils exposing (..)
import Types exposing (..)


serviceDecoder : Decode.Decoder Service
serviceDecoder =
    decode Service
        |> required "id" Decode.string
        |> required "Service Name" Decode.string
        |> hardcoded False
        |> required "Description" htmlMsgDecoder


htmlMsgDecoder : Decode.Decoder (Html Msg)
htmlMsgDecoder =
    Decode.string
        |> Decode.andThen stringToHtmlMsg


stringToHtmlMsg : String -> Decode.Decoder (Html Msg)
stringToHtmlMsg str =
    section [ class "description-service pa3 gray" ] (extractFromMarkdown str) |> Decode.succeed


servicesDecoder : Decode.Decoder (List Service)
servicesDecoder =
    Decode.list serviceDecoder


fetchServices : Cmd Msg
fetchServices =
    Http.get servicesUrl servicesDecoder
        |> Http.send OnFetchServices


servicesUrl : String
servicesUrl =
    -- "http://localhost:4000/api/v1/services"
    "https://womenscentre.herokuapp.com/api/v1/services"
