module Members.View exposing (root)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onCheck, onInput, targetValue)
import Types exposing (..)
import Routes exposing (..)
import Members.Types as MembersPage


root : Model -> Html Msg
root model =
    div []
        [ p [] [ text "Members List Here" ]
        , button [ onClick (msgViewMember 1) ] [ text "Send Message" ]
        ]


msgViewMember id =
    RoutingMsg <|
        MembersMsg <|
            MembersPage.ViewMember id
