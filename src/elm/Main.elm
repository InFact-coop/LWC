module Main exposing (..)

-- My Elm Files

import Commands exposing (..)
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
