module Games
  ( genGameBy,
    description,
    genTask,
    Game,
  )
where

import Data.Char (toLower)
import System.Random (genWord8, initStdGen)
import Task (Task, makeTask)
import Types (RightAnswer, UserInput)

data Game = Even | Calc | SimpleNumber

instance Show Game where
  show Even = "even"
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

genTask :: Game -> IO Task
genTask Even = genEvenTask
genTask Calc = genEvenTask
genTask SimpleNumber = genEvenTask

genEvenTask :: IO Task
genEvenTask = do
  number <- toInteger . fst . genWord8 <$> initStdGen
  return (makeEvenTask number)
  
makeEvenTask :: Integer -> Task
makeEvenTask number =  makeTask (show number) (convertToRightAnswer number)

convertToRightAnswer :: Integer -> RightAnswer
convertToRightAnswer number = if even number then "yes" else "no"

description :: Game -> String
description Even = "Answer \"yes\" if the number is even, otherwise answer \"no\"."
description Calc = "What is the result of the expression?"
description SimpleNumber = "Answer \"yes\" if given number is prime. Otherwise answer \"no\"."
