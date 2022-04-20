module EvenTest
  ( prop_makeEvenTask,
    prop_makeGCDTask,
    prop_makeCalcTask1,
    prop_makeCalcTask2,
    prop_makeCalcTask3,
  )
where

import Games.Calc (makeCalkTask)
import Games.Even (makeEvenTask)
import Games.GCD (makeGCDTask)
import Task (getQuestion, getRightAnswer)
import Test.QuickCheck
import Text.Printf

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
    right_question = makeGCDQuestion (show num1) (show num2)
    righ_answer = show $ gcd num1 num2

makeGCDQuestion = printf "%s %s"

prop_makeCalcTask1 num1 num2 = question == right_question && answer == righ_answer
  where
    pair = ((+), "+")
    task = makeCalkTask num1 num2 pair
    question = getQuestion task
    answer = getRightAnswer task
    right_question = makeCalcQuestion (show num1) (snd pair) (show num2)
    righ_answer = show $ fst pair num1 num2

prop_makeCalcTask2 num1 num2 = question == right_question && answer == righ_answer
  where
    pair = ((-), "-")
    task = makeCalkTask num1 num2 pair
    question = getQuestion task
    answer = getRightAnswer task
    right_question = makeCalcQuestion (show num1) (snd pair) (show num2)
    righ_answer = show $ fst pair num1 num2

prop_makeCalcTask3 num1 num2 = question == right_question && answer == righ_answer
  where
    pair = ((*), "*")
    task = makeCalkTask num1 num2 pair
    question = getQuestion task
    answer = getRightAnswer task
    right_question = makeCalcQuestion (show num1) (snd pair) (show num2)
    righ_answer = show $ fst pair num1 num2

makeCalcQuestion = printf "%s %s %s"
