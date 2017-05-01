port module State exposing (init, update, subscriptions)

import Types exposing (..)
import Routes exposing (..)
import Navigation exposing (Location)
import Members.State as MembersPage
import Articles.State as ArticlesPage


init : Types.Config -> Location -> ( Model, Cmd Msg )
init config route =
    ( { config = config
      , route = Main
      , routePath = "#"
      , membersPage = MembersPage.init
      , articlesPage = ArticlesPage.init
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    Routes.parseLocation location

                newModel =
                    model
                        |> setRoute newRoute
                        |> setRoutePath location.hash

                x =
                    Debug.log "State.update (model)" newModel
            in
                ( newModel, Cmd.none )

        RoutingMsg routingMsg ->
            updatePage routingMsg model

        NoOp ->
            ( model, Cmd.none )


updatePage :
    RoutingMsg
    -> { c | membersPage : b, articlesPage : a }
    -> ( { c | articlesPage : a, membersPage : b }, Cmd msg )
updatePage routingMsg model =
    case routingMsg of
        MembersMsg submsg ->
            let
                y =
                    Debug.log "MembersMsg subsub" submsg

                ( membersModel, membersCmds ) =
                    MembersPage.update submsg model.membersPage
            in
                ( { model | membersPage = membersModel }, membersCmds )

        ArticlesMsg submsg ->
            let
                y =
                    Debug.log "ArticlesMsg subsub" submsg

                ( articlesModel, articlesCmds ) =
                    ArticlesPage.update submsg model.articlesPage
            in
                ( { model | articlesPage = articlesModel }, articlesCmds )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- HELPERS


setRoute : a -> { c | route : b } -> { c | route : a }
setRoute route model =
    { model | route = route }


setRoutePath : a -> { c | routePath : b } -> { c | routePath : a }
setRoutePath routePath model =
    { model | routePath = routePath }
