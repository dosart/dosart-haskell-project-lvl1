import EvenTest (prop_makeEvenTask, prop_makeGCDTask)
import Test.QuickCheck

main :: IO ()
main = do
  quickCheckWith stdArgs {maxSuccess = 1000} prop_makeEvenTask
  quickCheckWith stdArgs {maxSuccess = 1000} prop_makeGCDTask
  putStrLn "Done!"
