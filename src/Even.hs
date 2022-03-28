module Even
(
    getDescroption,
    genTask

) where

import Task
import Types

data Game = EvenGame

getDescroption :: Types.GameDescription
getDescroption = "Answer \"yes\" if the number is even, otherwise answer \"no\"."

convertToRightAnswer :: Int -> Types.RightAnswer
convertToRightAnswer number = if even number then "yes" else "no"

number:: Int
number = 7

makeGame :: Game
makeGame = EvenGame

genTask :: IOTask.Task
genTask = return(Task.makeTask (show number) (convertToRightAnswer number))
