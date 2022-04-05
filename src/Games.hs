module Games
  ( genGameBy,
    description,
    Game,
  )
where

import Data.Char (toLower)
import Types (UserInput)

data Game = Even | Calc | SimpleNumber

instance Show Game where
  show Even = "even."
  show Calc = "calc"
  show SimpleNumber = "simpleNumber"

genGameBy :: UserInput -> Maybe Game
genGameBy = getGame . normalize

normalize :: UserInput -> String
normalize = map toLower

games :: [Game]
games = [Even, Calc, SimpleNumber]

getGame :: UserInput -> Maybe Game
getGame userInput = lookup userInput $ map (\game -> (show game, game)) games

description :: Game -> String
description Even = "Answer \"yes\" if the number is even, otherwise answer \"no\"."
description Calc = "What is the result of the expression?"
description SimpleNumber = "Answer \"yes\" if given number is prime. Otherwise answer \"no\"."
