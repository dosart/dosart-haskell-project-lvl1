import TasksTests
  ( prop_makeCalcTask1,
    prop_makeCalcTask2,
    prop_makeCalcTask3,
    prop_makeEvenTask,
    prop_makeGCDTask,
  )
import DescribeTest (prop_checkGameDescription)
import Test.QuickCheck

main :: IO ()
main = do
  quickCheckWith stdArgs {maxSuccess = 1000} prop_makeEvenTask
  quickCheckWith stdArgs {maxSuccess = 1000} prop_makeGCDTask

  quickCheckWith stdArgs {maxSuccess = 1000} prop_makeCalcTask1
  quickCheckWith stdArgs {maxSuccess = 1000} prop_makeCalcTask2
  quickCheckWith stdArgs {maxSuccess = 1000} prop_makeCalcTask3

  quickCheck prop_checkGameDescription
  putStrLn "Done!"
