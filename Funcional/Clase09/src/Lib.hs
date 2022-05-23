tieneNombreLargo mascota = length (fst mascota) > 9 == True
tieneNombreLargo mascota = length (fst mascota) > 9
tieneNombreLargo mascota = (> 9) . length . fst $ mascota



sumarEnergia (Persona _ energia _ _) = (Persona _ (energia + 5) _ _)

sumarEnergia (Persona nombre energia ciudad edad) = (Persona nombre (energia + 5) ciudad edad)

sumarEnergia unaPersona = mapEnergia (+ 5) unaPersona

mapEnergia unaFuncion (Persona nombre energia ciudad edad) = (Persona nombre (unaFuncion energia) ciudad edad)

data Persona = Persona String Int String Int

data Persona = Persona {
  nombre :: String,
  energia :: Int,
  ciudad :: String,
  edad :: Int
}



triplicarLosPares numeros = (map (*3) . filter . even) numeros

triplicarLosPares numeros = (map (*3) . filter even) numeros

triplicarLosPares numeros = map (*3) . filter even $ numeros

triplicarLosPares = map (*3) . filter even



sonTodosMamiferos animales = all (==True) (map esMamifero animales)

sonTodosMamiferos animales = all id (map esMamifero animales)

sonTodosMamiferos’ animales = (and . map esMamifero) animales

sonTodosMamiferos' animales = all esMamifero animales


zipWith esMultiplo [1,2,3] [6,7,8,9,10]
[False, False, False]


type Remodelacion = Casa -> Casa


abrirVentanas :: Remodelacion
prenderEstufa :: Remodelacion
encenderElAireA :: Casa -> Int -> Casa
mudarseA :: String -> Remodelacion


miCasaInteligente = Casa
   { direccion = "Medrano 951",
     temperatura = 26,
     reguladoresDeTemperatura = [
        abrirVentanas,
        prenderEstufa,
        mudarseA "Medrano 952",
        flip encenderElAireA 24
     ]
   }


take :: Int -> [a] -> [a]

flip take :: [a] -> Int -> [a]

sumaDe3 :: Int -> Int -> (Int -> Int)

1 + 2
(+) 1 2

suma 1 2
1 `suma` 2

1 `div` 2

encenderElAireAlReves :: Int -> Casa -> Casa
encenderElAireAlReves unaTemperatura unaCasa = encenderElAireA unaCasa unaTemperatura

abrirVentanas :: Casa -> Casa
abrirVentanas casa = casa {
  temperatura = temperatura casa - 2
}


esBeatle "Ringo" = True
esBeatle "John" = True
esBeatle "George" = True
esBeatle "Paul" = True
esBeatle _ = False


esBeatle unBeatle = elem unBeatle beatles
  where beatles = ["Ringo", "John", "George", "Paul"]

edad :: Persona -> Int

sumaDeLasEdadesRecursiva [] = 0
sumaDeLasEdadesRecursiva lista =
   edad (head lista) + sumaDeLasEdadesRecursiva (drop 1 lista)


sumaDeLasEdadesRecursiva [] = 0
sumaDeLasEdadesRecursiva personas =
   edad (head personas) + sumaDeLasEdadesRecursiva (tail personas)


sumaDeLasEdadesRecursiva [] = 0
sumaDeLasEdadesRecursiva (unaPersona : otrasPersonas) =
   edad unaPersona + sumaDeLasEdadesRecursiva otrasPersonas

unasPersonas = foldl1 ((+) . edad) unasPersonas -- No tipa!

unasPersonas = foldl ((+) . edad) 0 unasPersonas

unasPersonas = foldl (\sumatoria unaPersona -> sumatoria + edad unaPersona) 0 unasPersonas

sumaDeLasEdades unasPersonas = sum . map edad $ unasPersonas


agregarValor valor indice lista =
   take (indice - 1) lista  ++ valor : drop indice lista



poneleUnNombre numeros = (sum (map (*3) (filter even numeros))) < 100
poneleUnNombre numeros = ((< 100) . sum . map (* 3) . filter even) numeros

poneleUnNombre numeros = (< 100) . sum . map (* 3) . filter even $ numeros

poneleUnNombre = (< 100) . sum . map (* 3) . filter even

