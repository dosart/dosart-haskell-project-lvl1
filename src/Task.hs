module Task
  ( makeTask,
    getQuestion,
    getRightAnswer,
    createTask,
  )
where

import Types

type Task = (Types.Question, Types.RightAnswer)

makeTask :: Types.Question -> Types.RightAnswer -> Task
makeTask question rightAnswer = (question, rightAnswer)

getQuestion :: Task -> Types.Question
getQuestion = fst

getRightAnswer :: Task -> Types.RightAnswer
getRightAnswer = snd

convertToRightAnswer :: Int -> Types.RightAnswer
convertToRightAnswer number = if even number then "yes" else "no"

number :: Int
number = 7

testTask :: Task
testTask = makeTask (show number) (convertToRightAnswer number)

createTask :: IO Task
createTask = return testTask
