module State exposing (..)

import Commands exposing (..)
import Data.Quotes exposing (..)
import Data.Services exposing (..)
import Data.Testimonials exposing (..)
import Dom.Scroll exposing (..)
import Task exposing (..)
import Types exposing (..)


-- MODEL


initModel : Model
initModel =
    { route = TalkToUsRoute
    , formSent = NotSent
    , services = servicesList
    , testimonials = testimonialsList
    , currentTestimonial = 1
    , quotes = quotesList
    , burgerVisible = True
    , newHelpForm = HelpForm "" "" "" "" ""
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
        UrlChange location ->
            ( { model | route = getRoute location.hash }, Task.attempt (always NoOp) (toTop "container") )

        ToggleServiceListItem int ->
            ( { model | services = List.map (\x -> toggleServiceListItem int x) model.services }, Cmd.none )

        SelectTestimonial id ->
            ( { model | currentTestimonial = id }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


        ToggleBurgerMenu ->
            ( { model | burgerVisible = not model.burgerVisible }, Cmd.none )

        ChangeFormName helpForm name ->
            let
                newHelpForm =
                    { helpForm | name = name }
            in
            ( { model | newHelpForm = newHelpForm }, Cmd.none )

        ChangeFormDOB helpForm dob ->
            let
                newHelpForm =
                    { helpForm | dob = dob }
            in
            ( { model | newHelpForm = newHelpForm }, Cmd.none )

        ChangeFormNumber helpForm number ->
            let
                newHelpForm =
                    { helpForm | contactNumber = number }
            in
            ( { model | newHelpForm = newHelpForm }, Cmd.none )

        ChangeFormEmail helpForm email ->
            let
                newHelpForm =
                    { helpForm | email = email }
            in
            ( { model | newHelpForm = newHelpForm }, Cmd.none )

        ChangeFormPostcode helpForm postcode ->
            let
                newHelpForm =
                    { helpForm | postcode = postcode }
            in
            ( { model | newHelpForm = newHelpForm }, Cmd.none )

        SendHelpForm ->
            ( { model | newHelpForm = HelpForm "" "" "" "" "", formSent = Pending }, sendFormCmd model.newHelpForm )

        OnFormSent (Ok result) ->
            case result.success of
                True ->
                    ( { model | formSent = Success }, Cmd.none )

                False ->
                    ( { model | formSent = Failure }, Cmd.none )

        OnFormSent (Err result) ->
            ( { model | formSent = Failure }, Cmd.none )

