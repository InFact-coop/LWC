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
    , services : List Service
    , quotes : List Quote
    , testimonials : List Testimonial
    , currentTestimonial : Int
    }


type alias Service =
    { id : Int
    , name : String
    , isVisible : Bool
    , description : Html Msg
    }


type alias Quote =
    { id : Int
    , imgsrc : String
    , quote : String
    }


type alias Testimonial =
    { id : Int
    , name : String
    , age : String
    , imgsrc : String
    , therapy : String
    , description : Html Msg
    }



-- Update


type Msg
    = NoOp
    | Change String
    | UrlChange Navigation.Location
    | ToggleServiceListItem Int
    | SelectTestimonial Int
