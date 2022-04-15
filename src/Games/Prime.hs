module Games.Prime
  ( genPrimeGame,
  )
where

import Data.Numbers.Primes (isPrime)
import Games.DefaultGameProducer (genDefaultTask)
import Games.Game (Game (..))
import Task (Task)
import Types (Question, RightAnswer)

genPrimeGame :: Game
genPrimeGame = Game {description = describe, genTask = genPrimeTask}

describe :: String
describe = "Answer \"yes\" if the number is prime, otherwise answer \"no\"."

genPrimeTask :: IO (Task Question RightAnswer)
genPrimeTask = genDefaultTask isPrime
