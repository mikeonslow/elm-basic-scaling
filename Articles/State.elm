module Articles.State exposing (init, update, subscriptions)

import Types exposing (..)
import Articles.Types as ArticlesPage
import Routes exposing (..)
import Monocle.Lens exposing (..)
import Navigation exposing (Location)


init : ( ArticlesPage.Model, Cmd ArticlesPage.Msg )
init =
    ( { articles = []
      }
    , Cmd.none
    )



--update : ArticlesPage.Msg -> ArticlesPage.Model -> ( ArticlesPage.Model, Cmd ArticlesPage.Msg )


update msg model =
    case msg of
        ArticlesPage.ViewArticle id ->
            ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : ArticlesPage.Model -> Sub Msg
subscriptions model =
    Sub.none
