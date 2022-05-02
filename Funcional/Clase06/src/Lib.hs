import Text.Show.Functions

data Persona = Persona String Int (Persona -> Persona) deriving Show
{-
Formas de crear funciones:

- La "típica":

siguiente unNumero = unNumero + 1

- Los constructores de data

- Composición

doble unNumero = unNumero * 2

doble . siguiente

- Aplicación parcial

(+) :: Int -> Int -> Int

(+) 2 :: Int -> Int

- Expresiones Lambda / Funciones anónimas


siguiente unNumero = unNumero + 1
          |
          v
\unNumero -> unNumero + 1

siguienteDeLista :: [Int] -> [Int]
siguienteDeLista unosNumeros = map (\unNumero -> unNumero + 1) unosNumeros
siguienteDeLista unosNumeros = map siguiente unosNumeros


unaFuncion :: tipo del parametro1 -> tipo del parametro2 -> .... -> tipo del parametroN -> tipo del retorno

pam :: [(a -> b)] -> a -> [b]
pam unasFunciones unValor = map (\unaFuncion -> unaFuncion unValor) unasFunciones

unaFuncion unValor = unValor

precondiciones:
- Sólo la vamos a usar una vez
- No tenemos un buen nombre para la lógica


Currificación

sumaDe3 :: Int -> Int -> Int -> Int
sumaDe3 numero1 numero2 numero3 = numero1 + numero2 + numero3


sumaDe3' :: (Int -> Int -> Int -> Int)
sumaDe3' = \numero1 numero2 numero3 -> numero1 + numero2 + numero3


sumaDe3'' :: (Int -> (Int -> Int -> Int))
sumaDe3'' = \numero1 -> \numero2 numero3 -> numero1 + numero2 + numero3


sumaDe3''' :: (Int -> (Int -> (Int -> Int)))
sumaDe3''' = \numero1 -> \numero2 -> \numero3 -> numero1 + numero2 + numero3


Cuando definimos una función de N parámetros -> Se convierte en una cadena de N funciones de 1 parámetro
Las funciones de >1 parámetro no existen.



(.) :: (b -> c) -> (a -> b) -> (a -> c)
(.) f g = \x -> f (g x)

(.) :: (b -> c) -> (a -> b) -> a -> c
(.) f g x = f (g x)

(f . g) x = f (g x)

-}
