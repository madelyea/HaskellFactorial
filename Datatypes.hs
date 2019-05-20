module Datatypes where


type Variable = String
type Val = Int
type Save = Variable -> Val

data Op = Add | Sub | Mul | Div deriving (Show)

data Expr = Const Val | Var Variable | Bin Op Expr Expr |  deriving (Show)

data Stmt = Assign Variable Expr 
           | While Expr Stmt 
           | If Expr Stmt Stmt 
           | Compound Stmt Stmt 
           deriving (Show)

