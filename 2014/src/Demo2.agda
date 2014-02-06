module Demo2 where

data Nat : Set where
  Zero : Nat 
  Succ : Nat -> Nat

{-# BUILTIN NATURAL Nat #-}
{-# BUILTIN ZERO Zero #-}
{-# BUILTIN SUC Succ #-}

data Bool : Set where
  True : Bool
  False : Bool

data List (a : Set) : Set where
  Nil : List a
  Cons : a -> List a -> List a

data Maybe (a : Set) : Set where
  Nothing : Maybe a 
  Just : a -> Maybe a

_+_ : Nat -> Nat -> Nat
Zero + y = y
Succ x + y = Succ (x + y)

_<_ : Nat -> Nat -> Bool
Zero < Zero = False
Zero < Succ y = True
Succ x < Zero = False
Succ x < Succ y = x < y

data Pair (a : Set) (b : Set) : Set where
  _,_ : a -> b -> Pair a b

zip : {a b : Set} -> List a -> List b -> List (Pair a b)
zip Nil Nil = Nil
zip Nil (Cons x ys) = Nil
zip (Cons x xs) Nil = Nil
zip (Cons x xs) (Cons x₁ ys) = Cons (x , x₁) (zip xs ys)

head : {a : Set} -> List a -> Maybe a
head Nil = Nothing
head (Cons x xs) = Just x

data Vec (a : Set) : Nat -> Set where
  Nil : Vec a Zero
  Cons : {n : Nat} -> a -> Vec a n -> Vec a (Succ n)

vhead : {a : Set} {n : Nat} -> Vec a (Succ n) -> a
vhead (Cons x xs) = x

vip : {a b : Set} {n : Nat} -> Vec a n -> Vec b n -> Vec (Pair a b) n
vip Nil Nil = Nil
vip (Cons x xs) (Cons x₁ ys) = Cons (x , x₁) (vip xs ys)

min : Nat -> Nat -> Nat
min Zero y = Zero
min (Succ x) Zero = Zero
min (Succ x) (Succ y) = Succ (min x y)

minVip : {a b : Set} {n m : Nat} -> Vec a n -> Vec b m -> Vec (Pair a b) (min n m)
minVip Nil Nil = Nil
minVip Nil (Cons x ys) = Nil
minVip (Cons x xs) Nil = Nil
minVip (Cons x xs) (Cons x₁ ys) = Cons (x , x₁) (minVip xs ys)

append : {a : Set} {n m : Nat} -> Vec a n -> Vec a m -> Vec a (n + m)
append Nil ys = ys
append (Cons x xs) ys = Cons x (append xs ys)

v1 : Vec Bool (1 + 1) 
v1 = Cons True (Cons False Nil)

v2 : Vec Bool ((2 + 0) + 0)
v2 = v1

data Index : Nat -> Set where
  Fz : forall {n} -> Index (Succ n)
  Fs : forall {n} -> Index n -> Index (Succ n)
  
vlookup : {a : Set} {n : Nat} -> Vec a n -> Index n -> a
vlookup (Cons x xs) Fz = x
vlookup (Cons x xs) (Fs i) = x

data Empty : Set where

data One : Set where
  Unit : One

isTrue : Bool -> Set
isTrue True = One
isTrue False = Empty

isLessThan : Nat -> Nat -> Set
isLessThan x y = isTrue (x < y)

length : {a : Set} -> List a -> Nat
length Nil = Zero
length (Cons x xs) = Succ (length xs)

lookup : {a : Set} -> (xs : List a) -> (i : Nat) -> isLessThan i (length xs) -> a
lookup Nil Zero ()
lookup Nil (Succ n) ()
lookup (Cons x xs) Zero p = x
lookup (Cons x xs) (Succ n) p = lookup xs n p

data _==_ {a : Set} : (x y : a) -> Set where
  Refl : {x :  a} -> x == x

test : 3 == (1 + 2)
test = Refl

addZero : (n : Nat) -> (0 + n) == n
addZero n = Refl

sym : (x y : Nat) -> x == y -> y == x
sym x .x (Refl) = Refl

trans : {x y z : Nat} -> x == y -> y == z -> x == z
trans Refl Refl = Refl

cong : {x y : Nat} -> (f : Nat -> Nat)  -> x == y -> (f x) == (f y)
cong f Refl = Refl

addZero' : (n : Nat) -> (n + 0) == n
addZero' Zero = Refl
addZero' (Succ n) = cong Succ (addZero' n) 

decide : (n m : Nat) -> Maybe (n == m)
decide Zero Zero = Just Refl
decide Zero (Succ m) = Nothing
decide (Succ n) Zero = Nothing
decide (Succ n) (Succ m) with decide n m 
decide (Succ n) (Succ m) | Nothing = Nothing
decide (Succ .m) (Succ m) | Just Refl = Just Refl
