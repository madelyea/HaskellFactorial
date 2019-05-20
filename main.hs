import Interpreter
import Datatypes
import Factorial

main :: IO ()
main = do
	
	testFactorial

testFactorial :: IO()

testFacotial = do 
                     interpret(Factorial)