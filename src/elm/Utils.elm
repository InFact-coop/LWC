module Utils exposing (..)

import Components.Emphasis exposing (emphasis)
import Html exposing (..)
import Html.Attributes exposing (..)
import Http exposing (..)
import Json.Decode as Decode
import Json.Encode as Encode
import Types exposing (..)


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


extractFromMarkdown : String -> List (Html Msg)
extractFromMarkdown str =
    String.split "\n\n" str |> List.map paragraphNode


paragraphNode : String -> Html Msg
paragraphNode content =
    p [ class "" ] <| extractNewLineFromMarkdown content


sectionNode : String -> Html Msg
sectionNode content =
    div [ class "dib" ] <| extractEmphasisFromMarkdown content


lineBreak : Html Msg
lineBreak =
    br [] []


extractNewLineFromMarkdown : String -> List (Html Msg)
extractNewLineFromMarkdown str =
    String.split "\n" str |> List.map sectionNode |> List.intersperse lineBreak


extractEmphasisFromMarkdown : String -> List (Html Msg)
extractEmphasisFromMarkdown str =
    String.split "**" str
        |> List.indexedMap (,)
        |> List.map alternateTextEmphasis


alternateTextEmphasis : ( Int, String ) -> Html Msg
alternateTextEmphasis ( index, content ) =
    if index % 2 == 0 then
        text content
    else
        emphasis content


routeToColour : Route -> String
routeToColour route =
    case route of
        LandingRoute ->
            "black"

        QuotesRoute ->
            "hot-pink"

        DetailedQuoteRoute ->
            "hot-pink"

        ServicesRoute ->
            "purple"

        TalkToUsRoute ->
            "light-blue"

        FormRoute ->
            "light-blue"

        _ ->
            "black"
