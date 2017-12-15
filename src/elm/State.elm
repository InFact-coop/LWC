module State exposing (..)

import Types exposing (..)
import Data.Services exposing (..)


-- MODEL


initModel : Model
initModel =
    { route = LandingRoute
    , userInput = ""
    , services = servicesList
    }



--UPDATE


getRoute : String -> Route
getRoute hash =
    case hash of
        "#landing" ->
            LandingRoute

        "#quotes" ->
            QuotesRoute

        "#detailed-quote" ->
            DetailedQuoteRoute

        "#services" ->
            ServicesRoute

        "#talk-to-us" ->
            TalkToUsRoute

        "#form" ->
            FormRoute

        "#thank-you" ->
            ThankYouRoute

        _ ->
            LandingRoute


toggleServiceListItem : String -> ( Bool, String, String ) -> ( Bool, String, String )
toggleServiceListItem name ( isMappedVisible, mappedName, mappedDescription ) =
    if name == mappedName then
        ( not isMappedVisible, mappedName, mappedDescription )
    else
        ( False, mappedName, mappedDescription )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Change newInput ->
            ( { model | userInput = newInput }, Cmd.none )

        UrlChange location ->
            ( { model | route = (getRoute location.hash) }, Cmd.none )

        ToggleServiceListItem name ->
            ( { model | services = List.map (\x -> toggleServiceListItem name x) model.services }, Cmd.none )
