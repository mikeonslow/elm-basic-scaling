module Types exposing (..)

import RemoteData exposing (WebData)
import Monocle.Lens exposing (..)
import Routes exposing (parseLocation, Route)
import Navigation exposing (Location)
import Bootstrap.Navbar as Navbar
import Bootstrap.Accordion as Accordion
import Json.Encode as JE
import Phoenix.Socket
import Phoenix.Channel
import Phoenix.Push
import Members.Types as MembersPage
import Articles.Types as ArticlesPage


type alias Model =
    { config : Config
    , route : Route
    , routePath : String
    , membersPage : ( MembersPage.Model, Cmd MembersPage.Msg )
    , articlesPage : ( ArticlesPage.Model, Cmd ArticlesPage.Msg )
    }


type Msg
    = OnLocationChange Location
    | RoutingMsg RoutingMsg
    | NoOp


type RoutingMsg
    = MembersMsg MembersPage.Msg
    | ArticlesMsg ArticlesPage.Msg


type alias Config =
    String


type alias Session =
    String
