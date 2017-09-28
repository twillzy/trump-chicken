port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { image : String
    , spell : String
    , prompt : String
    }


init : ( Model, Cmd Msg )
init =
    ( Model "images/trump.png" "" "", Cmd.none )



-- UPDATE


type Msg
    = Cast String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Cast spell ->
            if isTrump model && isValidSpell spell then
                ( { model | image = "images/chicken.png", prompt = "" }, Cmd.none )
            else if isTrump model && not (isValidSpell spell) then
                ( { model | spell = spell, prompt = "Bad! " ++ "\"" ++ String.toUpper spell ++ "\" is not a valid spell..." }, Cmd.none )
            else
                ( { model | prompt = "Nice try... but this spell is irreversible 😈" }, Cmd.none )



-- SUBSCRIPTIONS


port spell : (String -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    spell Cast



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "Magic Transformation Spell 101:" ]
        , h2 [] [ text "\"TRUMP INTO CHICKEN\"" ]
        , img [ src model.image ] []
        , h2 [] [ text model.prompt ]
        ]



-- HELPER FUNCTIONS


isValidSpell : String -> Bool
isValidSpell spell =
    if String.toLower spell == "trump into chicken" then
        True
    else
        False


isTrump : Model -> Bool
isTrump model =
    if model.image == "images/trump.png" then
        True
    else
        False
