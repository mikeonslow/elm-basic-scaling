module Members.State exposing (init, update, subscriptions)

import Types exposing (..)
import Members.Types as MembersPage


init : ( MembersPage.Model, Cmd MembersPage.Msg )
init =
    ( { members = []
      }
    , Cmd.none
    )

update : MembersPage.Msg -> a -> ( a, Cmd msg )
update msg model =
    case msg of
        MembersPage.ViewMember id ->
            ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : MembersPage.Model -> Sub Msg
subscriptions model =
    Sub.none
