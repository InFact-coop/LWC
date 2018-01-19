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


serviceListItemHidden : Int -> String -> Html Msg
serviceListItemHidden id name =
    li [ class "container db mb3 " ]
        [ div [ class "ba b--solid b--purple br3 pa3 bg-white", onClick (ToggleServiceListItem id) ]
            [ span [ class "b purple v-mid" ]
                [ text name ]
            , div [ class "dib chevron-purple v-mid right-2" ] []
            ]
        ]


serviceListItemVisible : Int -> String -> Html Msg -> Html Msg
serviceListItemVisible id name description =
    li [ class "container db ba b--solid b--purple br3 mb3" ]
        [ div [ class "ba b--solid br--top b--purple pa3 br2 bg-purple", onClick (ToggleServiceListItem id) ]
            [ span [ class "b v-mid white" ]
                [ text name ]
            , div [ class "dib v-mid  right-2 chevron-white" ] []
            ]
        , description
        ]
