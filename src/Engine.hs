module Engine (runGame) where

import Task
import Types
import Utils

gameDescription :: String
gameDescription = "Answer \"yes\" if the number is even, otherwise answer \"no\"."

runGame :: IO ()
runGame = do
  putStrLn "Welcome to the Brain Games!"
  putStrLn "May I have your name? "
  name <- getLine
  putStrLn $ helloPerson name
  putStrLn gameDescription

  task <- createTask
  let question = getQuestion task
  let rightAnswer = getRightAnswer task

  putStrLn $ askQuestion question
  putStr "Your answer: "
  userAnswer <- getLine
  if userAnswer == rightAnswer
    then putStrLn "Correct!"
    else putStrLn (makeErrorMessage userAnswer rightAnswer) >> putStrLn (makeEndPhrase name)
