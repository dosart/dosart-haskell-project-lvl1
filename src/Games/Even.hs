module Games.Even
  ( genEvenGame,
  )
where

import Games.DefaultGameProducer (genDefaultTask)
import Games.Game (Game (..))
import Task (Task)
import Types (Question, RightAnswer)

genEvenGame :: Game
genEvenGame = Game {description = describe, genTask = genEvenTask}

describe :: String
describe = "Answer \"yes\" if the number is even, otherwise answer \"no\"."

genEvenTask :: IO (Task Question RightAnswer)
genEvenTask = genDefaultTask even
