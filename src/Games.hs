module Games
  (
  )
where

data Game = Even | Calc | SimpleNumber

instance Show Game where
  show Even = "even."
  show Calc = "calc"
  show SimpleNumber = "simpleNumber"

askGame :: IO String
askGame = putStr "What game do you want to play? " >> getLine

descroption :: Game -> String
descroption Even = "Answer \"yes\" if the number is even, otherwise answer \"no\"."
descroption Calc = "What is the result of the expression?"
descroption SimpleNumber = "Answer \"yes\" if given number is prime. Otherwise answer \"no\"."
