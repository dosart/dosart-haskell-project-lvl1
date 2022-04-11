module Utility
  ( askQuestion,
    makeErrorMessage,
    makeEndMessage,
    makeCongratulationsMessage,
    helloPerson,
  )
where

import Text.Printf
import Types (Message, Question, RightAnswer, UserName, WrongAnswer)

askQuestion :: Question -> String
askQuestion = printf "Question: %s"

helloPerson :: UserName -> Message
helloPerson = printf "Hello, %s!"

makeErrorMessage :: WrongAnswer -> RightAnswer -> Message
makeErrorMessage wrongAnswer rightAnswer = printf "'%s' is wrong answer ;(. Correct answer was '%s'." wrongAnswer rightAnswer

makeEndMessage :: String -> Message
makeEndMessage = printf "Let's try again, %s!"

makeCongratulationsMessage :: Types.UserName -> Message
makeCongratulationsMessage = printf "Congratulations, %s!"
