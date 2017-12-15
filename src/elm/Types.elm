module Types exposing (..)

import Navigation
import Html exposing (..)


-- Model


type Route
    = LandingRoute
    | QuotesRoute
    | DetailedQuoteRoute
    | ServicesRoute
    | TalkToUsRoute
    | FormRoute
    | ThankYouRoute


type alias Model =
    { route : Route
    , userInput : String
    , services : List ( Bool, String, String )
    , quotes : List ( String, String )
    , testimonials : List Testimonial
    , currentTestimonial : String
    }


type alias Testimonial =
    { name : String
    , age : String
    , imgsrc : String
    , therapy : String
    , description : Html Msg
    }



-- Update


type Msg
    = Change String
    | UrlChange Navigation.Location
    | ToggleServiceListItem String
