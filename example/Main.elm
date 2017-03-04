port module Main exposing (..)

import Html exposing (beginnerProgram, div, button, text, span)
import Html.Attributes exposing(style)
import Html.Events exposing (onClick)

import Task exposing (Task)

type alias UserQuery =
    { sessionId: String
    , userId: Int
    }
type alias User =
    { name: String
    , age: Int
    }
type alias UserError = String

port getUser : UserQuery -> Task UserError User

type alias Model =
    { currentUser: Maybe User
    , error: Maybe String
    }
initialState = { currentUser = Nothing, error = Nothing }

main =
  Html.program {
  init = init,
  view = view,
  update = update,
  subscriptions = subscriptions
  }

init = (initialState, Cmd.none)

subscriptions _ = Sub.none

usernameOrUnknown : Maybe User -> String
usernameOrUnknown maybeUser = case maybeUser of
  Just user ->
    user.name
  Nothing ->
    "unknown"

view model =
  div []
    [ text (model.currentUser |> Maybe.map .name |> Maybe.withDefault "unknown")
    , button [ onClick LoadUser ] [ text "Load user" ]
    , span [style [("color", "red")]] [ text (model.error |> Maybe.withDefault "") ]
    ]


type Msg = LoadUser | UserResult (Result UserError User)

getUserTask : Task UserError User
getUserTask = getUser { sessionId = "123", userId = 456 }

update msg model =
  case msg of
    LoadUser ->
      (model, Task.attempt UserResult <| getUser { sessionId = "123", userId = 456 })

    UserResult (Ok user) ->
      ({ model | currentUser = Just user, error = Nothing }, Cmd.none)

    UserResult (Err error) ->
      ({ model | currentUser = Nothing, error = Just error }, Cmd.none)
