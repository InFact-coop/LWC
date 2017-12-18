module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- My Elm Files

import Types exposing (..)
import Routes.LandingPage exposing (..)
import Routes.QuotesPage exposing (..)
import Routes.DetailedQuotePage exposing (..)
import Routes.ServicesPage exposing (..)
import Routes.TalkToUsPage exposing (..)
import Routes.FormPage exposing (..)
import Routes.ThankYouPage exposing (..)
import Components.NavBar exposing (..)


view : Model -> Html Msg
view model =
    let
        page =
            case model.route of
                LandingRoute ->
                    landingPage model

                QuotesRoute ->
                    quotesPage model

                DetailedQuoteRoute ->
                    detailedQuotePage model

                ServicesRoute ->
                    servicesPage model

                TalkToUsRoute ->
                    talkToUsPage model

                FormRoute ->
                    formPage model

                ThankYouRoute ->
                    thankYouPage model
    in
        div [ class "w-100 fixed overflow-y-scroll top-0 bottom-0", id "container" ]
            [ navBar model
            , page
            ]
