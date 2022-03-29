module Engine
  ( main,
  )
where

import Even (genTask, getDescroption)
import Task (getQuestion, getRightAnswer)
import Types (UserName)
import Utils (helloPerson, makeCongratulationsMessage, makeEndMessage, makeErrorMessage, askQuestion)

countRound :: Int
countRound = 3

main :: IO ()
main = do
  name <- greetings
  putStrLn getDescroption
  run name countRound

greetings :: IO UserName
greetings = do
  putStrLn "Welcome to the Brain Games!"
  putStrLn "May I have your name? "
  name <- getLine
  putStrLn $ helloPerson name
  return name

run :: UserName -> Int -> IO ()
run name countOfRound = do
  if countOfRound == 0
    then putStrLn (makeCongratulationsMessage name)
    else do
      task <- genTask
      putStrLn $ askQuestion $ getQuestion task
      userAnswer <- respond $ getQuestion task
      if userAnswer == getRightAnswer task
        then putStrLn "Correct! " >> run name (countOfRound - 1)
        else putStrLn (makeErrorMessage userAnswer (getRightAnswer task)) >> putStrLn (makeEndMessage name)

respond :: String -> IO String
respond task = do
  putStrLn task
  putStr "Your answer: " >> getLine
