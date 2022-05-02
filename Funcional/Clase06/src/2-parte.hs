-- Recursividad

-- una función que se llama a sí misma
-- una forma de salir - caso base
-- caso recursivo

factorial :: Int -> Int
factorial 0 = 1 -- caso base
factorial numero =
  numero * factorial (numero - 1) -- recursivo

fibonacci :: Int -> Int
fibonacci 0 = 0 -- caso base
fibonacci 1 = 1 -- caso base
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- Veamos los patrones para listas redefiniendo
-- null, head y tail

-- patrones
-- [] - lista vacia
-- (x:xs) - cabeza:cola
null' :: [a] -> Bool
null' [] = True
null' _  = False

head' :: [a] -> a
head' [] = undefined
head' (cabeza:_) = cabeza

tail' :: [a] -> [a]
tail' [] = undefined
tail' (_:cola) = cola


-- Repasamos las funcinoes (:) y (++)
-- 1 : [2, 3] === [1, 2, 3]
cons :: a -> [a] -> [a]
cons cabeza cola = cabeza : cola

-- [1, 2, 3] ++ [4, 5, 6] === [1, 2, 3, 4, 5, 6]
mm :: [a] -> [a] -> [a]
mm unaLista otraLista = unaLista ++ otraLista

-- Redefinamos algunas funciones conocidas
-- de manera recursiva:

-- * sum
sum' :: Num a => [a] -> a
sum' []            = 0
sum' (cabeza:cola) =
  (+) cabeza (sum' cola)

-- * all
all' :: (a -> Bool) -> [a] -> Bool
all' _ []                    = True
all' predicado (cabeza:cola) =
  (&&) (predicado cabeza) (all' predicado cola)

-- * lenght
length' :: [a] -> Int
length' [] = 0
length' (_:cola) =
  (+) 1 (length' cola)

-- * map
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' transformacion (cabeza:cola) =
  (:) (transformacion cabeza) (map' transformacion cola)


-- Prueben definir de manera recursiva o
-- mejor aún con algún tipo de fold
-- * last
-- * reverse
-- * take
-- * any
-- * elem

-- creamos foldr
plegarD :: (a -> b -> b) -> b -> [a] -> b
plegarD _ valorBase [] = valorBase
plegarD operacion valorBase (cabeza:cola) =
  (operacion) (cabeza) (plegarD operacion valorBase cola)

-- creamos foldl
plegarI :: (b -> a -> b) -> b -> [a] -> b
plegarI _ valorBase [] = valorBase
plegarI operacion valorBase (cabeza:cola) =
  plegarI operacion (operacion valorBase cabeza) cola

sum'' :: Num a => [a] -> a
sum'' lista = plegarD (+) 0 lista

-- prueben definir las funciones anteriores
-- (all, length y map) con fold

--- Links
-- http://learnyouahaskell.com/recursion
-- https://stevekrouse.com/hs.js/
-- https://github.com/lambdaconf/lambdaconf-2016-usa/blob/master/All%20about%20a%20Fold/All-about-a-fold.pdf
