module Game
  ( Game,
  )
where

data Game = Game {description :: String, id :: String, getTask :: IO Task}
