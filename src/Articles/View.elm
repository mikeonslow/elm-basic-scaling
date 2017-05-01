module Articles.View exposing (root)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onCheck, onInput, targetValue)
import Types exposing (..)
import Routes exposing (..)
import Articles.Types as ArticlesPage


root : Model -> Html Msg
root model =
    div []
        [ p [] [ text "Members List Here" ]
        , button [ onClick (msgViewArticle 1) ] [ text "Send Article Message" ]
        ]


msgViewArticle id =
    RoutingMsg <|
        ArticlesMsg <|
            ArticlesPage.ViewArticle id
