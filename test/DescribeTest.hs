module DescribeTest
  ( prop_checkGameDescription,
  )
where

import qualified Games.Calc as Calc
import qualified Games.Even as Even
import qualified Games.GCD as GCD
import qualified Games.Prime as Prime

prop_checkGameDescription =
       cal_desc   == "What is the result of the expression?"
    && even_desc  == "Answer \"yes\" if the number is even, otherwise answer \"no\"."
    && gcd_desc   == "Find the greatest common divisor of given numbers."
    && prime_desc == "Answer \"yes\" if the number is prime, otherwise answer \"no\"."
  where
    cal_desc = Calc.describe
    even_desc = Even.describe
    gcd_desc = GCD.describe
    prime_desc = Prime.describe
