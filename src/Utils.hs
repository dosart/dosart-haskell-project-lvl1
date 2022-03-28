module Utils
  ( askQuestion,
    makeErrorMessage,
    makeEndPhrase,
    helloPerson,
  )
where

import Text.Printf
import Types

askQuestion :: Types.Question -> String
askQuestion = printf "Question: %s"

makeErrorMessage :: Types.WrongAnswer -> Types.RightAnswer -> Message
makeErrorMessage = printf "'%s' is wrong answer ;(. Correct answer was '%s'."

makeEndPhrase :: String -> Types.Message
makeEndPhrase = printf "Let's try again, %s!"

helloPerson :: String -> String
helloPerson = printf "Hello, %s!"
