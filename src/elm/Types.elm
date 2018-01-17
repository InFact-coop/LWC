module Types exposing (..)

import Html exposing (..)
import Http
import Navigation


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
    , formSent : Maybe FormSent
    , services : List Service
    , quotes : List Quote
    , testimonials : List Testimonial
    , currentTestimonial : Int
    , newHelpForm : HelpForm
    }


type alias HelpForm =
    { name : String
    , dob : String
    , contactNumber : String
    , email : String
    , postcode : String
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


type alias FormResponse =
    { success : Bool
    }


type FormSent
    = Success
    | Failure
    | Pending



-- Update


type Msg
    = NoOp
    | UrlChange Navigation.Location
    | ToggleServiceListItem Int
    | SelectTestimonial Int
    | ChangeFormName HelpForm String
    | ChangeFormDOB HelpForm String
    | ChangeFormNumber HelpForm String
    | ChangeFormEmail HelpForm String
    | ChangeFormPostcode HelpForm String
    | SendHelpForm
    | OnFormSent (Result Http.Error FormResponse)
