module Task
  ( makeTask,
    getQuestion,
    getRightAnswer,
    produceTask,
    Task,
  )
where

data Task a b = Task { question :: a, rightAnswer :: b}

makeTask :: a -> b -> Task a b
makeTask q r = Task {question = q, rightAnswer = r}

getQuestion :: Task a b -> a
getQuestion = question

getRightAnswer :: Task a b -> b
getRightAnswer = rightAnswer

produceTask :: (a -> b) -> (a -> b) -> a -> Task b b
produceTask makeQuestion makeRightAnswer value = makeTask (makeQuestion value) (makeRightAnswer value)
