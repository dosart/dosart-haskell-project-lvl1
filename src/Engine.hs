module Engine
  ( main,
  )
where

import Game (Game (..))
import GameFactory (genGameBy)
import Types (CountRound, UserName)
import Task (makeTask, getQuestion, getRightAnswer, Task)
import Utility (helloPerson, makeCongratulationsMessage, askQuestion, makeErrorMessage, makeEndMessage)

countRound :: CountRound
countRound = 3

main :: IO ()
main = do
  user_name <- greetings
  maybe_game <- genGame
  case maybe_game of
    Just game -> runGame game countRound user_name
    Nothing -> print "Sorry! Game dosn't exist."

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

runGame :: Game -> CountRound -> UserName -> IO ()
runGame game round_counts name = do
  putStrLn $ description game
  run game round_counts name

run :: Game -> CountRound -> UserName -> IO ()
run game round_counts name = do
  if round_counts == 0
    then putStrLn (makeCongratulationsMessage name)
    else do
      task <- genTask game
      putStrLn $ askQuestion $ getQuestion task
      user_answer <- respond $ getQuestion task
      if user_answer == getRightAnswer task
        then putStrLn "Correct! " >> run game (round_counts - 1) name
        else putStrLn (makeErrorMessage user_answer (getRightAnswer task)) >> putStrLn (makeEndMessage name)

respond :: String -> IO String
respond task = do
  putStrLn "Your answer: "
  getLine
