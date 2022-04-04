module Games
(

) where

data Game = Even | Calc | SimpleNumber

instance Show Game where
    show  Even = "Answer \"yes\" if the number is even, otherwise answer \"no\"."
    show  Calc = "What is the result of the expression?"
    show  SimpleNumber = "Answer \"yes\" if given number is prime. Otherwise answer \"no\"."
