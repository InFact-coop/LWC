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
    { route = FormRoute
    , formSent = NotSent
    , services = servicesList
    , testimonials = testimonialsList
    , currentTestimonial = 1
    , quotes = quotesList
    , burgerVisible = True
    , newHelpForm = resetHelpForm
    }


resetHelpForm : HelpForm
resetHelpForm =
    HelpForm "" "" "" "" "" False False False False False False "" False



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

        ChangeFormMore helpForm moreInfo ->
            let
                newHelpForm =
                    { helpForm | moreInfo = moreInfo }
            in
            ( { model | newHelpForm = newHelpForm }, Cmd.none )

        CheckboxEmotion helpForm ->
            let
                newHelpForm =
                    { helpForm | emotionalWellbeing = not helpForm.emotionalWellbeing }
            in
            ( { model | newHelpForm = newHelpForm }, Cmd.none )

        CheckboxPersonal helpForm ->
            let
                newHelpForm =
                    { helpForm | personal = not helpForm.personal }
            in
            ( { model | newHelpForm = newHelpForm }, Cmd.none )

        CheckboxEmployment helpForm ->
            let
                newHelpForm =
                    { helpForm | employment = not helpForm.employment }
            in
            ( { model | newHelpForm = newHelpForm }, Cmd.none )

        CheckboxMoney helpForm ->
            let
                newHelpForm =
                    { helpForm | money = not helpForm.money }
            in
            ( { model | newHelpForm = newHelpForm }, Cmd.none )

        CheckboxVolunteering helpForm ->
            let
                newHelpForm =
                    { helpForm | volunteering = not helpForm.volunteering }
            in
            ( { model | newHelpForm = newHelpForm }, Cmd.none )

        CheckboxMeeting helpForm ->
            let
                newHelpForm =
                    { helpForm | meeting = not helpForm.meeting }
            in
            ( { model | newHelpForm = newHelpForm }, Cmd.none )

        CheckboxGDPR helpForm ->
            let
                newHelpForm =
                    { helpForm | gdpr = not helpForm.gdpr }
            in
            ( { model | newHelpForm = newHelpForm }, Cmd.none )

        SendHelpForm ->
            ( { model | formSent = Pending }, sendFormCmd model )

        OnFormSent (Ok result) ->
            case result.success of
                True ->
                    ( { model
                        | newHelpForm = resetHelpForm
                        , formSent = Success
                      }
                    , Cmd.none
                    )

                False ->
                    ( { model | formSent = Failure }, Cmd.none )

        OnFormSent (Err result) ->
            ( { model | formSent = Failure }, Cmd.none )
