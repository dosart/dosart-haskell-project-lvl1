module Games.Prime
  ( genPrimeGame,
  )
where

import Data.Numbers.Primes (isPrime)
import Games.Game (Game (..))
import RandomValue (genRandomNumber)
import Task (Task, makeTask)
import Text.Printf
import Types (Question, RightAnswer, noAnswer, yesAnswer)

genPrimeGame :: Game
genPrimeGame = Game {description = describe, genTask = genPrimeTask}

describe :: String
describe = printf "Answer \"%s\" if the number is prime, otherwise answer \"%s\"." yesAnswer noAnswer

genPrimeTask :: IO (Task Question RightAnswer)
genPrimeTask = do
  number <- genRandomNumber minValue maxValue
  return (makePrimeTask number)

minValue :: Integer
minValue = 0

maxValue :: Integer
maxValue = 100

makePrimeTask :: Integer -> Task Question RightAnswer
makePrimeTask number = makeTask (show number) (convertToRightAnswer number)

convertToRightAnswer :: Integer -> RightAnswer
convertToRightAnswer number = if isPrime number then yesAnswer else noAnswer
