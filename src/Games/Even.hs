module Games.Even
  ( genEvenGame,
    makeEvenTask,
    describe,
  )
where

import Games.Game (Game (..))
import RandomValue (genRandomNumber)
import Task (Task, makeTask)
import Text.Printf
import Types (Question, RightAnswer, noAnswer, yesAnswer)

genEvenGame :: Game
genEvenGame = Game {description = describe, genTask = genEvenTask}

describe :: String
describe = printf "Answer \"%s\" if the number is even, otherwise answer \"%s\"." yesAnswer noAnswer

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
convertToRightAnswer number = if even number then yesAnswer else noAnswer
