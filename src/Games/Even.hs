module Games.Even
  ( genEvenGame,
    makeEvenTask,
  )
where

import Games.Game (Game (..))
import RandomValue (genRandomNumber)
import Task (Task, makeTask)
import Types (Question, RightAnswer)

genEvenGame :: Game
genEvenGame = Game {description = describe, genTask = genEvenTask}

describe :: String
describe = "Answer \"yes\" if the number is even, otherwise answer \"no\"."

genEvenTask :: IO (Task Question RightAnswer)
genEvenTask = do
  number <- genRandomNumber minValue maxValue
  return (makeEvenTask number)

minValue :: Integer
minValue = 0

maxValue :: Integer
maxValue = 100

makeEvenTask :: Integer -> Task Question RightAnswer
makeEvenTask number = makeTask (show number) (convertToRightAnswer number)

convertToRightAnswer :: Integer -> RightAnswer
convertToRightAnswer number = if even number then "yes" else "no"
