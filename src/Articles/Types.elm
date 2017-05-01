module Articles.Types exposing (..)


type alias Model =
    { articles : List Article }


type alias Article =
    { id : Int, name : String }


type Msg
    = ViewArticle Int
    | NoOp
