module Even
  ( getDescroption,
    genTask,
  )
where

import Task (makeTask, Task)
import Types (GameDescription, RightAnswer)

import System.Random (initStdGen, genWord8)

data Game = EvenGame

getDescroption :: GameDescription
getDescroption = "Answer \"yes\" if the number is even, otherwise answer \"no\"."

convertToRightAnswer :: Integer -> RightAnswer
convertToRightAnswer number = if even number then "yes" else "no"


genTask :: IO Task
genTask = do
  number <- toInteger . fst . genWord8 <$> initStdGen
  return (makeTask (show number) (convertToRightAnswer number) )