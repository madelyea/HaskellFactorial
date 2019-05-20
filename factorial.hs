
Factorial(Compound((
			Assign("X" (Val(10)),
			Assign("F" (Val(1)),
			While((Greater (Var "X")(Val 1)),
				Compound((Assign("F" (Mul ("F")("X")))),
					     (Assign("X" (Mul (Sub("X")(1)))))
			    )),
			output("F")
		))
)))
