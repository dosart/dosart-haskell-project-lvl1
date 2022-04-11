module GameFactory
  ( genGameBy,
    Game,
  )
where

import Calc (genCalcGame)
import Even (genEvenGame)
import Game (Game)
import Types (UserInput)
import Data.Char

genGameBy :: UserInput -> Maybe Game
genGameBy = getGame . normalize

normalize :: UserInput -> String
normalize = map toLower

data GameType = Even | Calc

instance Show GameType where
  show Even = "even"
  show Calc = "calc"

getGame :: UserInput -> Maybe Game
getGame user_input = lookup user_input $  map ( \(t, game) -> (show t, game) ) games

games :: [(GameType, Game)]
games = [(Even, genEvenGame), (Calc, genCalcGame)]
