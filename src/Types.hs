module Types
  ( Question,
    RightAnswer,
    WrongAnswer,
    Message,
    GameDescription,
    UserName,
    CountRound,
    UserInput,
    yesAnswer,
    noAnswer,
  )
where

type Question = String

type RightAnswer = String

type WrongAnswer = String

type Message = String

type GameDescription = String

type UserName = String

type UserAnswer = String

type CountRound = Int

type UserInput = String

yesAnswer, noAnswer :: String
yesAnswer = "yes"
noAnswer = "no"
