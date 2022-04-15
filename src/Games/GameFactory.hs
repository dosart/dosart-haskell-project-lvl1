module Games.GameFactory
  ( genGameBy,
  )
where

import Data.Char
import Games.Calc (genCalcGame)
import Games.Even (genEvenGame)
import Games.GCD (genGCDGame)
import Games.Game (Game)
import Games.Prime (genPrimeGame)
import Types (UserInput)

genGameBy :: UserInput -> Maybe Game
genGameBy = getGame . normalize

normalize :: UserInput -> String
normalize = map toLower

data GameType = Even | Calc | Prime | GCD

instance Show GameType where
  show Even = "even"
  show Calc = "calc"
  show Prime = "prime"
  show GCD = "gcd"

getGame :: UserInput -> Maybe Game
getGame user_input = lookup user_input $ map (\(t, game) -> (show t, game)) games

games :: [(GameType, Game)]
games = [(Even, genEvenGame), (Calc, genCalcGame), (Prime, genPrimeGame), (GCD, genGCDGame)]
