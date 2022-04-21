module Games.GCD
  ( genGCDGame,
    makeGCDTask,
    describe,
  )
where

import Games.Game (Game (..))
import RandomValue (genRandomNumber, getRandomElem)
import Task (Task, makeTask)
import Text.Printf
import Types (Question, RightAnswer)

genGCDGame :: Game
genGCDGame = Game {description = describe, genTask = genGCDTask}

describe :: String
describe = "Find the greatest common divisor of given numbers."

genGCDTask :: IO (Task Question RightAnswer)
genGCDTask = do
  operand1 <- genRandomNumber minValue maxValue
  operand2 <- genRandomNumber minValue maxValue

  return (makeGCDTask operand1 operand2)

makeGCDTask :: Integer -> Integer -> Task Question RightAnswer
makeGCDTask num1 num2 = makeTask question righ_answer
  where
    question = makeQuestion (show num1) (show num2)
    righ_answer = show $ gcd num1 num2

minValue :: Integer
minValue = 0

maxValue :: Integer
maxValue = 20

makeQuestion :: String -> String -> String
makeQuestion = printf "%s %s"
