module Components.TestimonialSection exposing (..)

import Components.Rule exposing (..)
import Data.Testimonials exposing (defaultTestimonial)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


testimonialSection : Testimonial -> Html Msg
testimonialSection { name, age, imgsrc, therapy, description } =
    section [ class "testimonial ma3 ma0-l ba b--solid b--silver br3 mw7-m mw8-l m0-auto w-95 pa4-l w-90" ]
        [ header [ class "mb3 dib pl3 pt3" ]
            [ img [ class "dib h4 w4 v-btm", src imgsrc, alt name ]
                []
            , div [ class "dib ml3" ]
                [ h1 [ class "dib hot-pink f3 ma0" ]
                    [ text <| name ++ ", " ++ age ]
                , h2 [ class "f4 gray mt1 mb3" ]
                    [ text therapy ]
                , rule "black" "70%"
                ]
            ]
        , description
        ]


retrieveTestimonial : Model -> Html Msg
retrieveTestimonial model =
    List.filter (\n -> n.id == model.currentTestimonial) model.testimonials
        |> List.head
        |> Maybe.withDefault defaultTestimonial
        |> testimonialSection
