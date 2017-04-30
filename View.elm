module View exposing (root)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onCheck, onInput, targetValue)
import Types exposing (..)
import Routes exposing (..)
import Members.View as MembersPage


root : Model -> Html Msg
root model =
    let
        pageView =
            case model.route of
                Members ->
                    MembersPage.root model

                _ ->
                    div [] [ text "View not defined" ]
    in
        div []
            [ ul []
                [ li [] [ a [ href "#" ] [ text "Main" ] ]
                , li [] [ a [ href "#members" ] [ text "Members" ] ]
                , li [] [ a [ href "#articles" ] [ text "Articles" ] ]
                ]
            , h2 [] [ text (toString model.route) ]
            , pageView
            ]
