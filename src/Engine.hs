module Engine
  ( main,
  )
where

import Even (genTask, getDescroption)
import Games (Game, description, genGameBy)
import Task (getQuestion, getRightAnswer)
import Types (CountRound, UserInput, UserName)
import Utils (askQuestion, helloPerson, makeCongratulationsMessage, makeEndMessage, makeErrorMessage)

countRound :: CountRound
countRound = 3

main :: IO ()
main = do 
  user_name <- greetings
  maybe_game <- genGame
  case maybe_game of
    Just game -> do print (description game)
    Nothing -> print "Nothing"

greetings :: IO UserName
greetings = do
  putStrLn "Welcome to the Brain Games!"
  putStrLn "May I have your name? "
  name <- getLine
  putStrLn $ helloPerson name
  return name

genGame :: IO (Maybe Game)
genGame = fmap genGameBy gameName

gameName :: IO String
gameName = putStrLn "What game do you want to play? " >> getLine

run :: UserName -> CountRound -> IO ()
run name count_round = do
  if count_round == 0
    then putStrLn (makeCongratulationsMessage name)
    else do
      task <- genTask
      putStrLn $ askQuestion $ getQuestion task
      userAnswer <- respond $ getQuestion task
      if userAnswer == getRightAnswer task
        then putStrLn "Correct! " >> run name (count_round - 1)
        else putStrLn (makeErrorMessage userAnswer (getRightAnswer task)) >> putStrLn (makeEndMessage name)

respond :: String -> IO String
respond task = do
  putStrLn task
  putStrLn "Your answer: " >> getLine
