module State exposing (..)

import Data.Quotes exposing (..)
import Data.Services exposing (..)
import Data.Testimonials exposing (..)
import Dom.Scroll exposing (..)
import Task exposing (..)
import Types exposing (..)


-- MODEL


initModel : Model
initModel =
    { route = ServicesRoute
    , userInput = ""
    , services = servicesList
    , testimonials = testimonialsList
    , currentTestimonial = 1
    , quotes = quotesList
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


toggleServiceListItem : Int -> Service -> Service
toggleServiceListItem serviceId service =
    let
        mappedId =
            service.id
    in
    if serviceId == mappedId then
        { service | isVisible = not service.isVisible }
    else
        { service | isVisible = False }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Change newInput ->
            ( { model | userInput = newInput }, Cmd.none )

        UrlChange location ->
            ( { model | route = getRoute location.hash }, Task.attempt (always NoOp) (toTop "container") )

        ToggleServiceListItem int ->
            ( { model | services = List.map (\x -> toggleServiceListItem int x) model.services }, Cmd.none )

        SelectTestimonial id ->
            ( { model | currentTestimonial = id }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )
