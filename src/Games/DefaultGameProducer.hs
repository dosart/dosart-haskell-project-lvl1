module Games.DefaultGameProducer
  ( genDefaultTask,
  )
where

import RandomValue (genRandomNumber)
import Task (Task, produceTask)
import Types (Question, RightAnswer)

genDefaultTask :: (Integer -> Bool) -> IO (Task Question RightAnswer)
genDefaultTask pred = do
  let f = genRightAnswer pred
  let min_value = 0
  let max_value = 100

  fromRundom f min_value max_value

fromRundom :: (Integer -> RightAnswer) -> Integer -> Integer -> IO (Task Question RightAnswer)
fromRundom makeRightAnswer min_value max_value = do
  number <- genRandomNumber min_value max_value
  return (produceTask show makeRightAnswer number)

genRightAnswer = rightAnswer

rightAnswer :: (Integer -> Bool) -> Integer -> RightAnswer
rightAnswer f number = if f number then "yes" else "no"
