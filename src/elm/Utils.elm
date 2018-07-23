module Utils exposing (..)

import Types exposing (..)


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
