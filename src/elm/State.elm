module State exposing (..)

import Commands exposing (..)
import Data.Quotes exposing (..)
import Data.Services exposing (..)
import Data.Testimonials exposing (..)
import Delay
import Dom.Scroll exposing (..)
import Http exposing (..)
import Json.Decode as Decode
import Navigation exposing (..)
import Task exposing (..)
import Time
import Types exposing (..)
import Validate exposing (..)


-- MODEL


initModel : Model
initModel =
    { route = LandingRoute
    , formSent = NotSent
    , services = servicesList
    , testimonials = testimonialsList
    , currentTestimonial = "1"
    , quotes = quotesList
    , burgerVisible = True
    , validationErrors = []
    , newHelpForm = resetHelpForm
    }


resetHelpForm : HelpForm
resetHelpForm =
    HelpForm "" "" "" "" "" False False False False False False "" False False



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

        SendHelpForm ->
            case validate model.newHelpForm of
                [] ->
                    ( { model | validationErrors = [], formSent = Pending }, sendFormCmd model )

                errors ->
                    let
                        ( cmd, formStatus ) =
                            if (List.length errors == 1) && (List.head errors == Just { field = "GDPR", messages = [ "Please agree to the storage terms to submit your data" ] }) then
                                ( Cmd.none, FailureGDPR )
                            else
                                ( Task.attempt (always NoOp) (toTop "container"), FailureValidation )
                    in
                    ( { model | validationErrors = errors, formSent = formStatus }, cmd )

        OnFormSent (Ok result) ->
            case result.success of
                True ->
                    ( { model
                        | newHelpForm = resetHelpForm
                        , formSent = Success
                        , route = ThankYouRoute
                      }
                    , Cmd.batch [ Delay.after 3000 Time.millisecond GoHome, Task.attempt (always NoOp) (toTop "container") ]
                    )

                False ->
                    ( { model | formSent = FailureServer }, Cmd.none )

        OnFormSent (Err (BadStatus response)) ->
            handleBadStatusResponse response model

        OnFormSent (Err _) ->
            ( { model | formSent = FailureServer }, Cmd.none )

        SetField field value ->
            ( setField model model.newHelpForm field value, Cmd.none )

        OnFetchTestimonials (Ok result) ->
            let
                ( testimonials, quotes ) =
                    testqConvertor result
            in
            ( { model | testimonials = testimonials, quotes = quotes }, Cmd.none )

        OnFetchTestimonials (Err result) ->
            let
                testqs =
                    Debug.log "testimonials" result
            in
            ( model, Cmd.none )

        GoHome ->
            { model | route = LandingRoute }
                ! [ Navigation.newUrl "#home"
                  ]


handleBadStatusResponse : Response String -> Model -> ( Model, Cmd Msg )
handleBadStatusResponse response model =
    case response.status.code of
        400 ->
            getValErrors response.body model

        _ ->
            ( { model | formSent = FailureServer }, Cmd.none )


getValErrors : String -> Model -> ( Model, Cmd Msg )
getValErrors body model =
    let
        decodedResponse =
            Decode.decodeString validationResponseDecoder body
    in
    case decodedResponse of
        Ok errorList ->
            ( { model | formSent = FailureValidation, validationErrors = errorList }, Cmd.none )

        _ ->
            ( { model | formSent = FailureValidation }, Cmd.none )


validate : HelpForm -> List ValError
validate form =
    Validate.all
        [ .name
            >> Validate.ifBlank { field = "Name", messages = [ "Please enter a name" ] }
        , .dob
            >> Validate.ifBlank { field = "Date Of Birth", messages = [ "Please enter a date of birth" ] }
        , .email
            >> Validate.ifBlank { field = "Email", messages = [ "Please enter an email address" ] }
        , .email
            >> Validate.ifInvalidEmail { field = "Email", messages = [ "Please enter a valid email address" ] }
        , .contactNumber
            >> Validate.ifBlank { field = "Contact Number", messages = [ "Please enter a Contact number" ] }
        , .postcode
            >> Validate.ifBlank { field = "Postcode", messages = [ "Please enter a Postcode" ] }
        , .gdpr
            >> Validate.ifInvalid (\n -> not n) { field = "GDPR", messages = [ "Please agree to the storage terms to submit your data" ] }
        ]
        form


setField : Model -> HelpForm -> FormField -> String -> Model
setField model oldForm field value =
    let
        newForm =
            case field of
                Name ->
                    { oldForm | name = value }

                Dob ->
                    { oldForm | dob = value }

                ContactNumber ->
                    { oldForm | contactNumber = value }

                Email ->
                    { oldForm | email = value }

                Postcode ->
                    { oldForm | postcode = value }

                Therapy ->
                    { oldForm | therapy = not oldForm.therapy }

                Courses ->
                    { oldForm | courses = not oldForm.courses }

                Employment ->
                    { oldForm | employment = not oldForm.employment }

                Money ->
                    { oldForm | money = not oldForm.money }

                Volunteering ->
                    { oldForm | volunteering = not oldForm.volunteering }

                Meeting ->
                    { oldForm | meeting = not oldForm.meeting }

                MoreInfo ->
                    { oldForm | moreInfo = value }

                Gdpr ->
                    { oldForm | gdpr = not oldForm.gdpr }

                ContactMe ->
                    { oldForm | contactMe = not oldForm.contactMe }
    in
    { model | newHelpForm = newForm }


testqConvertor : List TestimonialQuote -> ( List Testimonial, List Quote )
testqConvertor testqlist =
    testqlist
        |> List.map (\item -> ( testimonialMaker item.id item.name item.age item.imgsrc item.therapy item.long1 item.long2, quoteMaker item.id item.imgsrc item.quote ))
        |> List.unzip
