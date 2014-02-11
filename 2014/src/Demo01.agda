module Demo where

data Bool : Set where
   True : Bool 
   False : Bool

not : Bool -> Bool
not True = False
not False = True

if_then_else_ : Bool -> Bool -> Bool -> Bool
if True then t else e = t
if False then t else e = e

data ℕ : Set where
  Zero : ℕ
  Succ : ℕ -> ℕ

_+_ : ℕ -> ℕ -> ℕ
Zero + y = y
Succ x + y = Succ (x + y)

data List (a : Set) : Set where
  Nil : List a
  Cons : a -> List a -> List a

xs : List Bool
xs = Cons True (Cons False Nil)

append : ∀ {a} -> List a -> List a -> List a
append Nil ys = ys
append (Cons x xs) ys = Cons x (append xs ys)
