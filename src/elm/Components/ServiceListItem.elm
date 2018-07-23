module Components.ServiceListItem exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


serviceListItem : Service -> Html Msg
serviceListItem { id, name, isVisible, description } =
    if isVisible == True then
        serviceListItemVisible id name description
    else
        serviceListItemHidden id name


serviceListItemHidden : String -> String -> Html Msg
serviceListItemHidden id name =
    li [ class "container db mb3 pointer" ]
        [ div [ class "ba b--solid b--silver br3 pa3 bg-white mw7-l bg-purple-hover", onClick (ToggleServiceListItem id) ]
            [ span [ class "b purple white-hover v-mid" ]
                [ text name ]
            , div [ class "dib chevron-black chevron-white-hover v-mid right-2" ] []
            ]
        ]


serviceListItemVisible : String -> String -> Html Msg -> Html Msg
serviceListItemVisible id name description =
    li [ class "container db ba b--solid b--purple br3 mb3 mw7-l" ]
        [ div [ class "ba b--solid br--top b--purple pa3 br2 bg-purple pointer", onClick (ToggleServiceListItem id) ]
            [ span [ class "b v-mid white" ]
                [ text name ]
            , div [ class "dib v-mid  right-2 chevron-white" ] []
            ]
        , description
        , a [ href "#talk-to-us", class "no-underline tc flex justify-center br1 center" ]
            [ p
                [ class "tc no-underline pt2 pb2 pl3 pr3 bg-purple b--purple ba br2 white w-30-l w-60 bg-white-hover purple-hover" ]
                [ text "Contact us" ]
            ]
        ]
