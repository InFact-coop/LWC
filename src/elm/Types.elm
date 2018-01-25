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
    , formSent : FormSent
    , services : List Service
    , quotes : List Quote
    , testimonials : List Testimonial
    , currentTestimonial : Int
    , burgerVisible : Bool
    , newHelpForm : HelpForm
    , validationErrors : List ValError
    }


type alias HelpForm =
    { name : String
    , dob : String
    , contactNumber : String
    , email : String
    , postcode : String
    , emotionalWellbeing : Bool
    , personal : Bool
    , employment : Bool
    , money : Bool
    , volunteering : Bool
    , meeting : Bool
    , moreInfo : String
    , gdpr : Bool
    , contactMe : Bool
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
    | FailureValidation
    | FailureServer
    | Pending
    | NotSent


type alias Button =
    { name : String
    , route : String
    }


type alias ValError =
    { field : String
    , messages : List String
    }


type FormField
    = Name
    | Dob
    | ContactNumber
    | Email
    | Postcode
    | EmotionalWellbeing
    | Personal
    | Employment
    | Money
    | Volunteering
    | Meeting
    | MoreInfo
    | Gdpr
    | ContactMe



-- Update


type Msg
    = NoOp
    | UrlChange Navigation.Location
    | ToggleServiceListItem Int
    | SelectTestimonial Int
    | ToggleBurgerMenu
    | SendHelpForm
    | OnFormSent (Result Http.Error FormResponse)
    | SetField FormField String
    | GoHome
