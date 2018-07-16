module Main exposing (..)

import Requests.Testimonials exposing (fetchTestimonialQuotes)
import Navigation
import State exposing (..)
import Types exposing (..)
import View exposing (..)


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = always ( initModel, fetchTestimonialQuotes )
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }
