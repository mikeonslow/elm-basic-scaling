module Members.Types exposing (..)


type alias Model =
    { members : List Member }


type alias Member =
    { id : Int, name : String }


type Msg
    = ViewMember Int
    | NoOp
