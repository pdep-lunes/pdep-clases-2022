-- alias de tipos!
--data Libro = UnLibro String String Int

data Libro = UnLibro {
  autor   :: String,
  titulo  :: String,
  paginas :: Int
} deriving (Show, Eq)


elVisitante :: Libro
elVisitante = UnLibro "Stephen King" "El Visitante" 592

elVisitante' :: (String, String, Int)
elVisitante' = ("Stephen King", "El Visitante", 592)

-- elVisitante == elVisitante'
-- True

shingeki1 :: Libro
shingeki1   = UnLibro "Hajime Isayama" "Shingeki no Kyojin 1"   40

shingeki3 :: Libro
shingeki3   = UnLibro "Hajime Isayama" "Shingeki no Kyojin 3"   40

shingeki127 :: Libro
shingeki127 = UnLibro "Hajime Isayama" "Shingeki no Kyojin 127" 40

fundacion :: Libro
fundacion = UnLibro "Isaac Asimov" "Fundación" 230

sandman5 :: Libro
sandman5 = UnLibro "Neil Gaiman" "Sandman 5" 35

sandman10 :: Libro
sandman10 = UnLibro "Neil Gaiman" "Sandman 10" 35

sandman12 :: Libro
sandman12 = UnLibro "Neil Gaiman" "Sandman 12" 35

eragon :: Libro
eragon = UnLibro "Christopher Paolini" "Eragon" 544

eldest :: Libro
eldest = UnLibro "Christopher Paolini" "Eldest" 704

brisignr :: Libro
brisignr = UnLibro "Christopher Paolini" "Brisignr" 700

legado :: Libro
legado = UnLibro "Christopher Paolini" "Legado" 811

-- Top-down -> Andá de lo general a lo específico -> Nos gusta esta!
-- Bottom-up -> Andá de lo específico a lo general

type Biblioteca = [Libro]

promedioDePaginas :: Biblioteca -> Int
promedioDePaginas unaBiblioteca = sumatoriaPaginasBiblioteca unaBiblioteca `div` length unaBiblioteca

sumatoriaPaginasBiblioteca :: Biblioteca -> Int
sumatoriaPaginasBiblioteca unaBiblioteca = sum . map paginas $ unaBiblioteca

-- Funciones normalmente prefijas
-- length
-- div
-- even
-- not
-- max
-- 
-- Notación infija: 10 `div` 2

-- Funciones normalmente infijas
-- +
-- ++
-- -
-- !!
-- ^
-- *
-- /
-- .
-- $
-- 
-- Notación prefija: (+) 10 2

-- filter (even . (+ 1) . length) ["Paradigmas", "de", "Programación"]
-- 
-- fromIntegral (length unaBiblioteca)
-- (fromIntegral . length) unaBiblioteca
-- unaFuncion $ unaBiblioteca
-- 
-- Precedencia de operadores
-- ()
-- Aplicacion prefija
-- .
-- ....
-- $



-- Sobredelegación!
-- cantidadDeLibrosBiblioteca :: Biblioteca -> Int
-- cantidadDeLibrosBiblioteca unaBiblioteca = length unaBiblioteca

miBiblioteca = [elVisitante, shingeki1, shingeki3, shingeki127, sandman5, sandman10, sandman12, legado, brisignr, eragon, eldest, fundacion]

lecturaObligatoria :: Libro -> Bool
lecturaObligatoria unLibro = esDeStephenKing unLibro || esDeSagaEragon unLibro || unLibro == fundacion

type Saga = [Libro]

sagaDeEragon :: Saga
sagaDeEragon = [eldest, eragon, brisignr, legado]

esDeSagaEragon' :: Libro -> Bool
esDeSagaEragon' unLibro = elem unLibro sagaDeEragon

-- Patrón fundacion
-- Patron fafafa
-- 
-- Valor fundacion

--                        Tipos
--                     vvvvvvvvvvvvv
lecturaObligatoria' :: Libro -> Bool
-- lecturaObligatoria' fundacion                                          = True  -- Esto no funciona porque el patrón matchea con cualquier cosa
--                     ^^^^^^^^^                                            ^^^^
--                     Patrones                                             Valores
lecturaObligatoria' (UnLibro "Isaac Asimov" "Fundacion" 230)                 = True
lecturaObligatoria' (UnLibro "Stephen King" _ _)                             = True
-- lecturaObligatoria' (_, ["Eragon", "Eldest", "Legado", "Brisignr"], _) = True    -- Este patrón no es válido para el tipo
-- lecturaObligatoria' (_, "Eragon", _)                                   = True
-- lecturaObligatoria' (_, "Eldest", _)                                   = True
-- lecturaObligatoria' (_, "Legado", _)                                   = True
-- lecturaObligatoria' (_, "Brisignr", _)                                 = True
-- lecturaObligatoria' (_, titulo, _)                                     = elem titulo ["Eragon", "Eldest", "Legado", "Brisignr"]
lecturaObligatoria' unLibro                                            = esDeSagaEragon unLibro


esDeStephenKing :: Libro -> Bool
esDeStephenKing unLibro = esDeAutor "Stephen King" unLibro

esDeSagaEragon :: Libro -> Bool
esDeSagaEragon unLibro = elem (titulo unLibro) ["Eragon", "Eldest", "Legado", "Brisignr"]

bibliotecaFantasiosa :: Biblioteca -> Bool
bibliotecaFantasiosa unaBiblioteca = any esLibroFantasioso unaBiblioteca

esLibroFantasioso :: Libro -> Bool
esLibroFantasioso unLibro = esDeAutor "Christopher Paolini" unLibro || esDeAutor "Neil Gaiman" unLibro

esDeAutor :: String -> Libro -> Bool
esDeAutor unAutor unLibro = autor unLibro == unAutor

nombreDeLaBiblioteca :: Biblioteca -> String
nombreDeLaBiblioteca unaBiblioteca = sinVocales . concat . listaDeTitulos $ unaBiblioteca

sinVocales :: String -> String
sinVocales unNombre = filter (not . esVocal) unNombre

esVocal :: Char -> Bool
esVocal unCaracter = elem unCaracter "aeiouAEIOU"

listaDeTitulos :: Biblioteca -> [String]
listaDeTitulos unaBiblioteca = map titulo unaBiblioteca

bibliotecaLigera :: Biblioteca -> Bool
bibliotecaLigera unaBiblioteca = all esLecturaLigera unaBiblioteca

esLecturaLigera :: Libro -> Bool
esLecturaLigera unLibro = paginas unLibro <= 40

genero :: Libro -> String
genero unLibro
  | esDeAutor "Stephen King" unLibro = "Terror"
  | esDeAutorJapones         unLibro = "Manga"
  | paginas unLibro < 40             = "Comic"

-- max' :: Ord a => a -> a -> a
-- max' unValor otroValor
--   | unValor > otroValor = unValor
--   | otherwise           = otroValor

-- ¡NO!
-- esDeStephenKing unLibro
--   | autor unLibro == "Stephen King" = True
--   | otherwise                       = False

esDeAutorJapones :: Libro -> Bool
esDeAutorJapones unLibro = esDeAutor "Hajime Isayama" unLibro

-- abs' :: Int -> Int
-- abs' unEntero
--   | unEntero < 0  = -unEntero
--   | otherwise     = unEntero

{-
Los 3 grandes mundos de funcional:

- Los Tipos
- Los Valores
- Los Patrones

               Tipos
             vvvvvvvvvv
siguiente :: Int -> Int
siguiente unNumero = unNumero + 1
          ^^^^^^^^   ^^^^^^^^^^^^
          Patrones     Valores
-}


data Persona = UnaPersona String String Int

juli :: Persona
juli = UnaPersona "Julián" "Berbel Alt" 27

gus :: Persona
gus = UnaPersona "Gustavo" "Trucco" 30


{-
Tipos:      Tipo "Persona"
Patrones    Patron "UnaPersona"
Valores     Valor / Función "UnaPersona"
-}

agregarPaginas :: Libro -> Int -> Libro
agregarPaginas (UnLibro unAutor unTitulo unasPaginas) paginasAAgregar = UnLibro unAutor unTitulo (unasPaginas + paginasAAgregar)
--agregarPaginas unLibro unasPaginas = unLibro { paginas = paginas unLibro + unasPaginas }

sacarSecuela :: Libro -> Libro
sacarSecuela unLibro = unLibro { titulo = titulo unLibro ++ " 2", paginas = paginas unLibro + 50 }

-- Agrego el punto 7 del tp
--hhldfsakfsdafsdafsadfdsajfsakl
