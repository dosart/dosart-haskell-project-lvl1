module Utils
(
    askQuestion,
    makeErrorMessage,
    makeEndMessage,
    makeCongratulationsMessage,
    helloPerson
) where

import Text.Printf
import Types

askQuestion :: Types.Question -> String
askQuestion = printf "Question: %s"

helloPerson :: String -> String
helloPerson = printf "Hello, %s!"

makeErrorMessage :: Types.WrongAnswer -> Types.RightAnswer -> Message
makeErrorMessage wrongAnswer rightAnswer = printf "'%s' is wrong answer ;(. Correct answer was '%s'." wrongAnswer rightAnswer

makeEndMessage :: String -> Types.Message
makeEndMessage = printf "Let's try again, %s!"

makeCongratulationsMessage :: Types.UserName -> Types.Message
makeCongratulationsMessage = printf "Congratulations, %s!"

    