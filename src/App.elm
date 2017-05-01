module App exposing (main)

import Navigation
import State
import Types exposing (..)
import View


main : Program Config Model Msg
main =
    Navigation.programWithFlags OnLocationChange
        { init = State.init
        , update = State.update
        , subscriptions = State.subscriptions
        , view = View.root
        }
