module Task
  ( makeTask,
    getQuestion,
    getRightAnswer,
    Task,
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
