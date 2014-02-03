module Printf where

-- To type check this file you will need to install the Agda standard
-- library:
--
--   http://wiki.portal.chalmers.se/agda/pmwiki.php?n=Libraries.StandardLibrary
--

open import Data.String
open import Data.Nat
open import Data.Char
open import Data.List renaming (_∷ʳ_ to snoc)
open import IO
open import Data.Unit


-- What arguments does a given format string require? 
printfType : List Char -> Set₁
printfType ('%' ∷ 's' ∷ cs) = String -> printfType cs
printfType ('%' ∷ 'd' ∷ cs) = ℕ -> printfType cs
printfType (x ∷ x₁ ∷ cs) = printfType (x₁ ∷ cs)
printfType cs = IO Unit

exampleString = "x = %d; msg = %d"



printf : (str : String) -> printfType (toList str)
printf str = {!!}

printfExample : ℕ -> ℕ -> IO Unit
printfExample  = printf exampleString