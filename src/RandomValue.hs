module RandomValue
  ( genRandomNumber,
    getRandomElem,
  )
where

import System.Random (randomRIO)

genRandomNumber :: Integer -> Integer -> IO Integer
genRandomNumber min_value max_value = randomRIO (min_value, max_value)

getRandomElem :: [a] -> IO a
getRandomElem l = do
  let size_list = length l
  index <- randomRIO (0, size_list - 1)
  return (l !! index)
