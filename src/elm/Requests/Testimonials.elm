module Requests.Testimonials exposing (..)

import Http exposing (..)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Types exposing (..)


testimonialQuoteDecoder : Decode.Decoder TestimonialQuote
testimonialQuoteDecoder =
    decode TestimonialQuote
        |> required "id" Decode.string
        |> required "Name" Decode.string
        |> required "Age" Decode.string
        |> required "Image source" Decode.string
        |> required "Therapy" Decode.string
        |> required "Short Quote" Decode.string
        |> required "Long Quote Part One" Decode.string
        |> required "Long Quote Part Two" Decode.string


testimonialQuotesDecoder : Decode.Decoder (List TestimonialQuote)
testimonialQuotesDecoder =
    Decode.list testimonialQuoteDecoder


fetchTestimonialQuotes : Cmd Msg
fetchTestimonialQuotes =
    Http.get testimonialsUrl testimonialQuotesDecoder
        |> Http.send OnFetchTestimonials


testimonialsUrl : String
testimonialsUrl =
    "http://localhost:4000/api/v1/testimonials"
