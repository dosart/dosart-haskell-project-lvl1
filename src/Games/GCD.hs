module Games.GCD
  ( genGCDGame,
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

  let question = makeQuestion (show operand1)  (show operand2)
  let righ_answer = show $ gcd operand1 operand2

  return (makeTask question righ_answer)

minValue :: Integer
minValue = 0

maxValue :: Integer
maxValue = 20

makeQuestion :: String -> String -> String
makeQuestion = printf "%s %s"
