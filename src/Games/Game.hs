module Games.Game
  ( Game (..),
  )
where

import Task (Task)
import Types (Question, RightAnswer)

data Game = Game {description :: String, genTask :: IO (Task Question RightAnswer)}
