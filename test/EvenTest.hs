module EvenTest
  ( prop_makeEvenTask,
    prop_makeGCDTask,
  )
where

import Games.Even (makeEvenTask)
import Games.GCD (makeGCDTask)
import Task (getQuestion, getRightAnswer)
import Test.QuickCheck
import Types (Question, RightAnswer)

prop_makeEvenTask number =
  if even number
    then righ_answer == "yes" && question == show number
    else righ_answer == "no" && question == show number
  where
    task = makeEvenTask number
    question = getQuestion task
    righ_answer = getRightAnswer task


prop_makeGCDTask num1 num2 = question == right_question && answer == righ_answer
  where
    task = makeGCDTask num1 num2
    question = getQuestion task
    answer = getRightAnswer task
    right_question = show num1 ++ " " ++ show num2
    righ_answer = show $ gcd num1 num2
