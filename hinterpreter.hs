module Interpreter where

import Datatypes


solve :: Op -> Int -> Int -> Int
solve Add x y = x + y
solve Sub x y = x - y
solve Mul x y = x * y
solve Div x y = x `div` y 

valid :: Op -> Int -> Int -> Bool
valid Add _ _ = True
valid Sub x y = x > y
valid Mul _ _ = True
valid Div x y = x `mod` y == 0 

eval :: Expr -> Save -> Val
eval (Const y) _ = y
eval (Var x) v = retrieve v x
eval (Add e1 e2) s = eval e1 s + eval e2 s 
eval (Sub e1 e2) s = eval e1 s - eval e2 s
eval (Mul e1 e2) s = eval e1 s * eval e2 s
eval (Div e1 e2) s = eval e1 `div` e2 s
eval (Greater e1 e2) s = if eval e1 s > eval e2 s then 1 else 0
eval (Less e1 e2) s = if eval e1 < eval e2 s then 1 else 0


retrieve :: Save -> Variable -> Val
retrieve v x = v x

start :: Save
start = \_ -> 0

save :: Save -> Variable -> Val -> Save
save v x y = \z -> if z == x then y else retrieve v z

interpret :: Stmt -> Save -> Save
interpret (Assign v e) = save s v (eval e s)
interpret (Compound s1 s2) = interpret s2 (interpret s1 s)
interpret (While e c) s = bool (eval e s)(interpret (Compound c (While e c))) id s
interpret (If e s1 s2) s = 

bool:: Val -> (Save -> Save) -> (Save -> Save) -> Save -> Save
bool 1 f _ s = f s
bool 0 _ g s = g s
