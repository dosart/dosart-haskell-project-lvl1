module Calc
  ( genCalcGame,
  )
where

import Game (Game (..))
import RandomValue (genRandomNumber, getRandomElem)
import Task (Task, makeTask)
import Text.Printf

genCalcGame :: Game
genCalcGame = Game {description = describe, genTask = genCalcTask}

describe :: String
describe = "What is the result of the expression?"

genCalcTask :: IO Task
genCalcTask = do
  operand1 <- genRandomNumber minValue maxValue
  operand2 <- genRandomNumber minValue maxValue
  operation <- getRandomElem operations

  let question = makeQuestion (show operand1) (snd operation) (show operand2)
  let right_answer = makeRightAnswer operand1 (fst operation) operand2

  return (makeTask question (show right_answer))

minValue :: Integer
minValue = 0

maxValue :: Integer
maxValue = 20

operations = [((+), "+"), ((-), "-"), ((*), "*")]

makeQuestion :: String -> String -> String -> String
makeQuestion op1 operation op2 = printf "%s %s %s" op1 operation op2

makeRightAnswer :: a -> (a -> a -> b) -> a -> b
makeRightAnswer op1 operation op2 = operation op1 op2
