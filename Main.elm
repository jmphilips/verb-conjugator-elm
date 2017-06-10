import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)

main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }

type alias Model =
  { holdValue : String,
    outputValue : String
  }

model : Model
model =
  { holdValue = ""
  , outputValue = ""
  }

type Msg
  = UpdateHold String
  | PolitePast
  | PoliteNegative
  | CasualNegative

update : Msg -> Model -> Model
update msg model =
  case msg of
    UpdateHold userInput ->
      { model | holdValue = userInput }
    PolitePast ->
      { model | outputValue = (politePast model.holdValue), holdValue = "" }
    PoliteNegative ->
      { model | outputValue = (politeNegative model.holdValue), holdValue = "" }
    CasualNegative ->
      { model | outputValue = (casualNegative model.holdValue), holdValue = "" }


view : Model -> Html Msg
view model =
  div [mainStyle]
    [ h2 [divElementStyle] [ text "Write a ます Japanese verb" ]
    , div [divElementStyle] [
        input [ onInput UpdateHold
              , id "text-input"
              , value model.holdValue
              ] []
      ]
    , div [divElementStyle]
      [ button [ onClick PolitePast ] [ text "Polite Past" ]
      , button [ onClick PoliteNegative ] [ text "Polite Negative" ]
      , button [ onClick CasualNegative ] [ text "Casual Negative" ]
      , div [divElementStyle] [ text model.outputValue ]
      ]
    ]

-- Helper Functions for Japanese

politePast : String -> String
politePast str =
  (String.dropRight 2 str) ++ "した"

politeNegative : String -> String
politeNegative str =
  (String.dropRight 2 str) ++ "ません"

casualNegative : String -> String
casualNegative str =
  (String.dropRight 2 str) ++ "ない"

-- Styles

mainStyle =
  style
    [ ( "font-family", "calibri, helvetica" )
    , ( "margin", "auto" )
    , ( "margin-top", "3em" )
    , ( "padding", "40px" )
    , ( "max-width", "30em")
    , ( "min-height", "20em")
    , ( "background-color", "#00aba9" )
    ]

divElementStyle =
  style
    [ ( "text-align", "center" )
    , ( "padding", "1em")
    ]