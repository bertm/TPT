module Demo3 where

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

_+_ : Nat -> Nat -> Nat
Zero + y = y
Succ x + y = Succ (x + y)

_<_ : Nat -> Nat -> Bool
Zero < Zero = False
Zero < Succ y = True
Succ x < Zero = False
Succ x < Succ y = x < y

-- lttrans : (x y z : Nat) -> isTrue (x < y) -> isTrue (y < z) -> isTrue (x < z)

-- data LT : Nat -> Nat -> Set where
--   Base
--   Step 

-- trans : (x y z : Nat) -> LT x y -> LT y z -> LT x z

-- toLT : isTrue (x < y ) -> LT x y
-- fromLT : LT x y -> isTrue (x < y)

-- isTrue (2 < 324)
-- LT 2 324


data Vec (a : Set) : Nat -> Set where
  Nil : Vec a Zero
  Cons : {n : Nat} -> a -> Vec a n -> Vec a (Succ n)

data _==_ {a : Set} : (x y : a) -> Set where
  Refl : {x :  a} -> x == x

sym : {a : Set} -> (x y : a) -> x == y -> y == x
sym .y y (Refl {.y}) = Refl

-- open import Relation.Binary.PropositionalEquality

-- plusZero : (n : Nat) -> (n + 0) ≡ n
-- plusZero Zero = refl
-- plusZero (Succ k) rewrite (plusZero k) = refl

filter : {a : Set} -> (a -> Bool) -> List a -> List a
filter p Nil = Nil
filter p (Cons x xs) with p x
... | True = Cons x (filter p xs)
... | False = filter p xs

data SubList {a : Set} : List a -> List a -> Set where
  Base : SubList Nil Nil
  Keep : forall {x xs ys} -> SubList xs ys -> SubList (Cons x xs) (Cons x ys)
  Drop : forall {y zs ys} -> SubList zs ys -> SubList zs (Cons y ys)

plusZero' : (n : Nat) -> (n + 0) == n
plusZero' n = plusZero' n

filterLemma : {a : Set} -> (p : a -> Bool) -> (xs : List a) -> SubList (filter p xs) xs
filterLemma p Nil = Base
filterLemma p (Cons x xs) with p x
filterLemma p (Cons x xs) | True = Keep (filterLemma p xs)
filterLemma p (Cons x xs) | False = Drop (filterLemma p xs) 



















data Pair (a : Set) (b : a -> Set) : Set where
  _,_ : (x : a) -> b x -> Pair a b

data LT : Nat -> Nat -> Set where
  -- ...

lhExample : Pair Nat (\x -> LT x 7)
lhExample = {!!}


double : Nat -> Nat
double Zero = Zero
double (Succ n) = Succ (Succ (double n))

data Parity : Nat -> Set where
  IsOdd : (k : Nat) -> Parity (Succ (double k))
  IsEven : (k : Nat) -> Parity (double k)

parity? : (n : Nat) -> Parity n
parity? Zero = IsEven Zero
parity? (Succ Zero) = IsOdd Zero
parity? (Succ (Succ n)) with parity? n
parity? (Succ (Succ .(Succ (double k)))) | IsOdd k = IsOdd (Succ k)
parity? (Succ (Succ .(double k))) | IsEven k = IsEven (Succ k)

parityUsage : {P : Nat -> Set} -> (n : Nat) -> P n
parityUsage n with parity? n
parityUsage .(Succ (double k)) | IsOdd k = {!!}
parityUsage .(double k) | IsEven k = {!!}

data Elem {a : Set} (x : a) : List a -> Set where
  Top : forall {ys} -> Elem x (Cons x ys)
  Pop : forall {y ys} -> Elem x ys -> Elem x (Cons y ys)

toNat : {a : Set} {x : a} {xs : List a} -> Elem x xs -> Nat
toNat Top = Zero
toNat (Pop elem) = Succ (toNat elem)

length : {a : Set} -> List a -> Nat
length Nil = Zero
length (Cons x xs) = Succ (length xs)

data Lookup {a : Set} (xs : List a) : Nat -> Set where
  InBounds : (x : a)  (elem : Elem x xs) -> Lookup xs (toNat elem)
  OutOfBounds : (m : Nat) -> Lookup xs (length xs + m)

lookup : {a : Set} (xs : List a) (n : Nat) -> Lookup xs n
lookup Nil n = OutOfBounds n
lookup (Cons x xs) Zero = InBounds x Top
lookup (Cons x xs) (Succ n) with lookup xs n
lookup (Cons x₁ xs) (Succ .(toNat elem)) | InBounds x elem = InBounds x (Pop elem)
lookup (Cons x xs) (Succ .(length xs + m)) | OutOfBounds m = OutOfBounds m

exampleList : List Nat
exampleList = Cons 3 (Cons 2 (Cons 1 Nil))

exampleLookup : (n : Nat) -> Lookup exampleList n
exampleLookup n with lookup exampleList n
exampleLookup .(toNat elem) | InBounds x elem = {!!}
exampleLookup .(Succ (Succ (Succ m))) | OutOfBounds m = {!!}
















data Type : Set where
  i : Type
  _=>_ : Type -> Type -> Type

el : Type -> Set
el i = Bool
el (s => t) = el s -> el t

data Term : List Type -> Type -> Set where
  App : forall {s t Gamma} -> Term Gamma (s => t) -> Term Gamma s -> Term Gamma t
  Lam : forall {s t Gamma} -> (body : Term (Cons s Gamma) t) -> Term Gamma (s => t)
 --  Var : Nat -> Term

eval : forall {Gamma s} -> Term Gamma s -> el s
eval (App t t₁) = eval t (eval t₁)
eval (Lam t₁) = \x -> eval t₁