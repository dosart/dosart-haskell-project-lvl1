module Even
  ( genEvenGame,
  )
where

import Game ( Game (..) )
import RandomValue (genRandomNumber)
import Task (Task, makeTask)
import Types (RightAnswer)

genEvenGame :: Game
genEvenGame = Game {description = describe, genTask = genEvenTask}

describe :: String
describe = "What is the result of the expression?."

genEvenTask :: IO Task
genEvenTask = do
  number <- genRandomNumber minValue maxValue
  return (makeEvenTask number)

minValue :: Integer
minValue = 0

maxValue :: Integer
maxValue = 100

makeEvenTask :: Integer -> Task
makeEvenTask number = makeTask (show number) (convertToRightAnswer number)

convertToRightAnswer :: Integer -> RightAnswer
convertToRightAnswer number = if even number then "yes" else "no"
