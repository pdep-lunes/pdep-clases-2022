lista1 = [1..5]

lista2 = [1,2,3,4,5]

lista3 = [1..1000]

--unaListaLoca = [2, "Hola"]

{-
Lazy evaluation / evaluación perezosa / evaluación diferida - Call by name

head [1..]
^^^^

(\(cabeza : _) -> cabeza) [1..]


(*) (2 + 3) 5


head (filter (> 3) [1..])

(\(cabeza : _) -> cabeza) (filter (> 3) [4..])

(\(cabeza : _) -> cabeza) (4 : filter (> 3) [5..])



Eager evaluation / evaluación ansiosa - Call by value

head [1..]
     ^^^^^

head [1,2,3,4,5,6,7,8,........]
-}

data Persona = Persona {
  nombre :: String,
  apellido :: String,
  edad :: Int
} deriving Show


--cumplirAños  unaPersona              = unaPersona { edad = edad unaPersona + 1 }
--                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ^^^
--                                          se repite                      no se repite
--                                                            unaFuncion (edad unaPersona)
--duplicarEdad unaPersona              = unaPersona { edad = edad unaPersona * 2 }

--copiarPersona unaPersona otraPersona = unaPersona { edad = edad otraPersona, apellido = apellido otraPersona }
--                                                            (\_ -> edad otraPersona) (edad unaPersona)
--                                                            const (edad otraPersona) (edad unaPersona)

mapEdad :: (Int -> Int) -> Persona -> Persona
mapEdad unaFuncion unaPersona     = unaPersona {     edad = unaFuncion .     edad $ unaPersona }

mapNombre :: (String -> String) -> Persona -> Persona
mapNombre unaFuncion unaPersona   = unaPersona {   nombre = unaFuncion .   nombre $ unaPersona }

mapApellido :: (String -> String) -> Persona -> Persona
mapApellido unaFuncion unaPersona = unaPersona { apellido = unaFuncion . apellido $ unaPersona }

--mapEdad :: (Int -> Int) -> Persona -> Persona
--mapEdad unaFuncion (nombre, apellido, edad) = (nombre, apellido, unaFuncion edad)



copiarPersona :: Persona -> Persona -> Persona
copiarPersona unaPersona otraPersona = mapApellido (const (apellido otraPersona)) . mapEdad (const (edad otraPersona))  $ unaPersona


cumplirAños unaPersona = mapEdad (+ 1) unaPersona
duplicarEdad unaPersona = mapEdad (* 2) unaPersona

-- transformarEdad
-- cambiarEdad
-- modificarEdad

cumplir100Años unaPersona = mapEdad (const 100) unaPersona
