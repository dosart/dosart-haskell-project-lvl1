module Games.Prime
  ( genPrimeGame,
  )
where

import Data.Numbers.Primes (isPrime)
import RandomValue (genRandomNumber)
import Games.Game (Game (..))
import Task (Task, makeTask)
import Types (Question, RightAnswer)

genPrimeGame :: Game
genPrimeGame = Game {description = describe, genTask = genPrimeTask}

describe :: String
describe = "Answer \"yes\" if the number is prime, otherwise answer \"no\"."

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
convertToRightAnswer number = if isPrime number then "yes" else "no"
