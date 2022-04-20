module Games.Calc
  ( genCalcGame,
    makeCalkTask,
  )
where

import Games.Game (Game (..))
import RandomValue (genRandomNumber, getRandomElem)
import Task (Task, makeTask)
import Text.Printf
import Types (Question, RightAnswer)

genCalcGame :: Game
genCalcGame = Game {description = describe, genTask = genCalcTask}

describe :: String
describe = "What is the result of the expression?"

genCalcTask :: IO (Task Question RightAnswer)
genCalcTask = do
  operand1 <- genRandomNumber minValue maxValue
  operand2 <- genRandomNumber minValue maxValue
  operation <- getRandomElem operations

  return (makeCalkTask operand1 operand1 operation)

makeCalkTask :: Integer -> Integer -> ((Integer -> Integer -> Integer), String) -> Task Question RightAnswer
makeCalkTask num1 num2 operation = makeTask question (show right_answer)
  where
    question = makeQuestion (show num1) (snd operation) (show num2)
    right_answer = makeRightAnswer num1 (fst operation) num2

minValue :: Integer
minValue = 0

maxValue :: Integer
maxValue = 20

operations = [((+), "+"), ((-), "-"), ((*), "*")]

makeQuestion :: String -> String -> String -> String
makeQuestion = printf "%s %s %s"

makeRightAnswer :: a -> (a -> a -> b) -> a -> b
makeRightAnswer op1 operation = operation op1
