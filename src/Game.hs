module Game
  ( Game (..),
  )
where

import Task (Task)

data Game = Game {description :: String, genTask :: IO Task}
