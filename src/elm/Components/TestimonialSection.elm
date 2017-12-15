module Components.TestimonialSection exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Data.Testimonials exposing (defaultTestimonial)
import Components.Rule exposing (..)


testimonialSection : Testimonial -> Html Msg
testimonialSection { name, age, imgsrc, therapy, description } =
    section [ class "testimonial ma3 ba b--solid b--silver br3 pa4" ] [ header [ class "mb3 dib" ] [ img [ class "dib h4 w4 v-btm", src imgsrc, alt name ] [], div [ class "dib ml3" ] [ h1 [ class "dib purple f3 ma0" ] [ text <| name ++ ", " ++ age ], h2 [ class "f4 gray mt1 mb3" ] [ text therapy ], rule "purple" "70%" ] ], description ]


retrieveTestimonial : Model -> Html Msg
retrieveTestimonial model =
    List.filter (\n -> n.name == model.currentTestimonial) model.testimonials
        |> List.head
        |> Maybe.withDefault defaultTestimonial
        |> testimonialSection
