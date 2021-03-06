# elm-basic-scaling
### Overview
A basic example of scaling in Elm

### Goals
Define a basic patten for scaling Elm apps in accordance with TEA (The Elm Architecture)

### Conventions

#### Project Setup

Your top level file should named `App.elm` and should contain only the code necessary to bootstrap the project

```elm
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
```

The file structure for each "Feature" (`Model, View, Update`) should be as follows:

- `Types.elm` contains any non-generic type definitions for the feature/page
- `State.elm` contains `Update` function, `subscriptions` and `init` functions as well as any top level helpers for these functions to work
- `View.elm` contains `View` code for the feature/page (_Note: logic for actually transforming the `Model` data into proper view data should be kept in the ViewModel.elm file_)
- `Selectors.elm` contains code for transforming and reduce your raw `Model` into `View` code (reducing the amount of code necessary in your views. (_Note: I'm considering renaming this ViewModel.elm_)
- `Routes.elm` (_optional_) should contain any routes specific to the feature (some projects will only need this in the top level directory)
- `Decoders.elm` (_optional_) contains the decoders necessary for the feature/page (note if decoders span multiple domains ex: Users, ThingOne, ThingTwo etc, I'd suggest breaking those out into their own files ex: UsersDecoder.elm etc.)
- `Encoders.elm` (_optional_) contains the decoders necessary for the feature/page (Same as with the Decoders, I'd break these out if they span multiple domains.)
- `Sockets.elm` (_optional_) contains socket code unique to a feature/page


### References and sources of Inspiration
1. The Elm Architecture: https://guide.elm-lang.org/architecture/
2. Scaling the Elm Architecture: https://guide.elm-lang.org/reuse/
2. Structuring Elm apps: http://blog.jenkster.com/2016/04/how-i-structure-elm-apps.html
2. Modularity in Elm: https://becoming-functional.com/nine-guidelines-for-modular-elm-development-fe18d2f7885e
2.1. There are also many other good Elm articles at https://becoming-functional.com/
3. Using selectors for View business logic: https://medium.com/@ckoster22/upgrade-your-elm-views-with-selectors-1d8c8308b336
