module EvenTest
  ( prop_makeEvenTask,
  )
where

import Games.Even (makeEvenTask)
import Task (getQuestion, getRightAnswer)
import Test.QuickCheck

prop_makeEvenTask number =
  if even number
    then righ_answer == "yes" && question == show number
    else righ_answer == "no" && question == show number
  where
    task = makeEvenTask number
    question = getQuestion task
    righ_answer = getRightAnswer task
