module Task
  ( makeTask,
    getQuestion,
    getRightAnswer,
    genOneNumberTask,
    Task,
  )
where

import Types (Question, RightAnswer)

type Task = (Question, RightAnswer)

makeTask :: Question -> RightAnswer -> Task
makeTask question rightAnswer = (question, rightAnswer)

getQuestion :: Task -> Question
getQuestion = fst

getRightAnswer :: Task -> RightAnswer
getRightAnswer = snd

genOneNumberTask :: (Integer -> RightAnswer) -> Integer -> Task
genOneNumberTask f number = makeTask (show number) (f number)
