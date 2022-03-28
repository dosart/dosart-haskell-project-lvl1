module Engine
(
    main
) where

import Utils
import Task
import Types
import Even

countRound :: Int
countRound = 3

main:: IO()
main = do
    name <- greetings
    putStrLn Even.getDescroption
    run name countRound

greetings :: IO(Types.UserName)
greetings = do
    putStrLn "Welcome to the Brain Games!" 
    putStrLn "May I have your name? "
    name <- getLine
    putStrLn $ Utils.helloPerson name
    return name

run :: Types.UserName -> Int -> IO()
run name countOfRound = do
    if countOfRound == 0
    then putStrLn (Utils.makeCongratulationsMessage name)
    else do
        task <- Even.genTask
        putStrLn $ askQuestion $ Task.getQuestion task
        userAnswer <- respond $ getQuestion task
        if    userAnswer == Task.getRightAnswer task
        then  putStrLn "Correct! " >> run name (countOfRound - 1)
        else  putStrLn (Utils.makeErrorMessage userAnswer (Task.getRightAnswer task)) >> putStrLn (Utils.makeEndMessage name)

respond :: String -> IO(String)
respond task = do
    putStrLn task
    putStr "Your answer: " >> getLine