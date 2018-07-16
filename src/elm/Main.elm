module Main exposing (..)

import Requests.Testimonials exposing (fetchTestimonialQuotes)
import Requests.Services exposing (fetchServices)
import Navigation
import State exposing (..)
import Types exposing (..)
import View exposing (..)


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = always ( initModel, Cmd.batch [ fetchTestimonialQuotes, fetchServices ] )
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }
