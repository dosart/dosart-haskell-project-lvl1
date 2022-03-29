module Even
  ( getDescroption,
    genTask,
  )
where

import System.Random (genWord8, initStdGen)
import Task (Task, makeTask)
import Types (GameDescription, RightAnswer)

data Game = EvenGame

getDescroption :: GameDescription
getDescroption = "Answer \"yes\" if the number is even, otherwise answer \"no\"."

convertToRightAnswer :: Integer -> RightAnswer
convertToRightAnswer number = if even number then "yes" else "no"

genTask :: IO Task
genTask = do
  number <- toInteger . fst . genWord8 <$> initStdGen
  return (makeTask (show number) (convertToRightAnswer number))
