module Types exposing (..)

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
    , userInput : String
    , services : List ( Bool, String, String )
    }



-- Update


type Msg
    = Change String
    | UrlChange Navigation.Location
    | ToggleServiceListItem String
