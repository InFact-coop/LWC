module Components.ServiceListItem exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


serviceListItem : ( Bool, String, String ) -> Html Msg
serviceListItem ( isVisible, title, description ) =
    if isVisible == True then
        serviceListItemVisible title description
    else
        serviceListItemHidden title


serviceListItemHidden : String -> Html Msg
serviceListItemHidden title =
    li [ class "container db" ]
        [ div [ class "ba b--solid b--purple br2 pa3 bg-white mb2", onClick (ToggleServiceListItem title) ]
            [ span [ class "purple v-mid" ]
                [ text title ]
            , div [ class "dib chevron-purple v-mid absolute right-2" ] []
            ]
        ]


serviceListItemVisible : String -> String -> Html Msg
serviceListItemVisible title description =
    li [ class "container db" ]
        [ div [ class "ba b--solid b--purple pa3 br2 bg-purple mb2", onClick (ToggleServiceListItem title) ]
            [ span [ class "v-mid white" ]
                [ text title ]
            , div [ class "dib v-mid absolute right-2 chevron-white" ] []
            ]
        ]
