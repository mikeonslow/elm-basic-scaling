module Routes exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map Main top
        , map Members (s "members")
        , map Articles (s "articles")
        ]


type Route
    = Main
    | Members
    | Articles
    | NotFoundRoute


parseLocation : Location -> Route
parseLocation location =
    let
        x =
            Debug.log "location" location

        y =
            Debug.log "parseHash matchers location" (parseHash matchers location)
    in
        case (parseHash matchers location) of
            Just route ->
                route

            Nothing ->
                NotFoundRoute
