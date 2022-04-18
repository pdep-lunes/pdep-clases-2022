-- alias de tipos!
type Libro = (String, String, Int)

elVisitante :: Libro
elVisitante = ("Stephen King", "El Visitante", 592)

elVisitante' :: (String, String, Int)
elVisitante' = ("Stephen King", "El Visitante", 592)

-- elVisitante == elVisitante'
-- True

shingeki1 :: Libro
shingeki1   = ("Hajime Isayama", "Shingeki no Kyojin 1",   40)

shingeki3 :: Libro
shingeki3   = ("Hajime Isayama", "Shingeki no Kyojin 3",   40)

shingeki127 :: Libro
shingeki127 = ("Hajime Isayama", "Shingeki no Kyojin 127", 40)

fundacion :: Libro
fundacion = ("Isaac Asimov", "Fundación", 230)

sandman5 :: Libro
sandman5 = ("Neil Gaiman", "Sandman 5", 35)

sandman10 :: Libro
sandman10 = ("Neil Gaiman", "Sandman 10", 35)

sandman12 :: Libro
sandman12 = ("Neil Gaiman", "Sandman 12", 35)

eragon :: Libro
eragon = ("Christopher Paolini", "Eragon", 544)

eldest :: Libro
eldest = ("Christopher Paolini", "Eldest", 704)

brisignr :: Libro
brisignr = ("Christopher Paolini", "Brisignr", 700)

legado :: Libro
legado = ("Christopher Paolini", "Legado", 811)

-- Top-down -> Andá de lo general a lo específico -> Nos gusta esta!
-- Bottom-up -> Andá de lo específico a lo general

type Biblioteca = [Libro]

promedioDePaginas :: Biblioteca -> Int
promedioDePaginas unaBiblioteca = sumatoriaPaginasBiblioteca unaBiblioteca `div` length unaBiblioteca

sumatoriaPaginasBiblioteca :: Biblioteca -> Int
sumatoriaPaginasBiblioteca unaBiblioteca = sum . map paginas $ unaBiblioteca

paginas :: Libro -> Int
paginas (_, _, paginasDeLibro) = paginasDeLibro


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

esDeStephenKing :: Libro -> Bool
esDeStephenKing unLibro = esDeAutor "Stephen King" unLibro

autor :: Libro -> String
autor (unAutor, _, _) = unAutor

esDeSagaEragon :: Libro -> Bool
esDeSagaEragon unLibro = elem (titulo unLibro) ["Eragon", "Eldest", "Legado", "Brisignr"]

titulo :: Libro -> String
titulo (_, unTitulo, _) = unTitulo


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
