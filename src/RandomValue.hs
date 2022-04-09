module RandomValue
  ( genRandomNumber,
  )
where

import System.Random (randomRIO)

genRandomNumber :: Integer -> Integer -> IO Integer
genRandomNumber min_value max_value = randomRIO (min_value, max_value)
