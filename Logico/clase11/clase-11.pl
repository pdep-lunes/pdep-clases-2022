% BASE DE CONOCIMIENTOS

%escribio(Autor, Obra) -> hecho (hay 24 claúsulas)
escribio(elsaBornemann, socorro).
escribio(neilGaiman, sandman).
escribio(alanMoore, watchmen).
escribio(brianAzarello, cienBalas).
escribio(warrenEllis, planetary).
escribio(frankMiller, elCaballeroOscuroRegresa).
escribio(frankMiller, batmanAnioUno).
escribio(neilGaiman, americanGods).
escribio(neilGaiman, buenosPresagios).
escribio(terryPratchett, buenosPresagios).
escribio(isaacAsimov, fundacion).
escribio(isaacAsimov, yoRobot).
escribio(isaacAsimov, elFinDeLaEternidad).
escribio(isaacAsimov, laBusquedaDeLosElementos).
escribio(joseHernandez, martinFierro).
escribio(stephenKing, it).
escribio(stephenKing, misery).
escribio(stephenKing, carrie).
escribio(stephenKing, elJuegoDeGerald).
escribio(julioCortazar, rayuela).
escribio(jorgeLuisBorges, ficciones).
escribio(jorgeLuisBorges, elAleph).
escribio(horacioQuiroga, cuentosDeLaSelva).
escribio(horacioQuiroga, cuentosDeLocuraAmorYMuerte).

% Agregamos qué obras son cómics.

esComic(sandman).
esComic(cienBalas).
esComic(watchmen).
esComic(planetary).
esComic(elCaballeroOscuroRegresa).
esComic(batmanAnioUno).

% Queremos saber si alguien es artista del noveno arte (comics).
% Lo resolvemos por comprensión.
% esArtistaDelNovenoArte/1 predicado con dos claúsulas (una regla y un hecho).

% p ^ q => r -> en discreta
% r <= p ^ q -> en lógico

esArtistaDelNovenoArte(Artista) :- % regla
    escribio(Artista, Obra),
    esComic(Obra).

% En lógico no asignamos. Sí ligamos o unificamos, por eso no hace falta decir que la "Obra" es la misma.

% Y si también queremos aclarar que Art Spiegelman es un artista del noveno arte, hacemos:

esArtistaDelNovenoArte(artSpiegelman). % hecho

% Un predicado inversible me permite realizar consultas existenciales (pasar un _ o una variable sin ligar), además de las invididuales.

% copiasVendidas(Obra,Cantidad)
copiasVendidas(socorro, 10000).
copiasVendidas(sandman, 20000).
copiasVendidas(watchmen, 30000).
copiasVendidas(cienBalas, 40000).
copiasVendidas(planetary, 50000).
copiasVendidas(elCaballeroOscuroRegresa, 60000).
copiasVendidas(batmanAnioUno, 70000).
copiasVendidas(americanGods, 80000).
copiasVendidas(buenosPresagios, 90000).
copiasVendidas(buenosPresagios, 10000).
copiasVendidas(fundacion, 20000).
copiasVendidas(yoRobot, 30000).
copiasVendidas(elFinDeLaEternidad, 30000).
copiasVendidas(laBusquedaDeLosElementos, 40000).
copiasVendidas(martinFierro, 50000).
copiasVendidas(it, 60000).
copiasVendidas(it, 70000).
copiasVendidas(misery, 70000).
copiasVendidas(carrie, 80000).
copiasVendidas(elJuegoDeGerald, 90000).
copiasVendidas(rayuela, 10000).
copiasVendidas(ficciones, 20000).
copiasVendidas(elAleph, 30000).
copiasVendidas(cuentosDeLaSelva, 40000).
copiasVendidas(cuentosDeLocuraAmorYMuerte, 50000).

% Una obra es un bestseller si vendió más de 50mil copias.

esBestSeller(Obra) :-
    copiasVendidas(Obra, Cantidad),
    Cantidad > 50000.

% Un artista es reincidente si escribió al menos 2 obras.

esReincidente(Artista) :-
    escribio(Artista, UnaObra),
    escribio(Artista, OtraObra),
    UnaObra \=  OtraObra.

% Una obra es un libro cuando NO es un comic.
% not no es inversible!! No puede ligar las variables dentro de su predicado.
% Si a esLibro no le agregamos el generador, no sería un predicado inversible porque el not no es inversible.
% El generador nos "achica" el universo de opciones.

esLibro(Obra) :-
    esObra(Obra), % generador para que esLibro sea inversible
    not(esComic(Obra)).

esObra(Obra) :-
    escribio(_, Obra).

% Tarea: Una obra le gusta a Gus si es Sandman o la escribió Isaac Asimov. Tiene que ser inversible.

% Alternativa 2
leGustaAGus(sandman).

leGustaAGus(Obra):-
  escribio(isaacAsimov, Obra). 

% Alternativa 3
leGusta(gus, sandman).

leGusta(gus, Obra) :-
  escribio(isaacAsimov, Obra).


% Tarea: Conviene contratar un artista si escribió un bestseller o es reincidente. Tiene que ser inversible.

convieneContratar(Artista) :-
  escribio(Artista, Obra),
  esBestSeller(Obra).

convieneContratar(Artista) :-
  esReincidente(Artista).

% Tarea: Queremos saber si una obra es rioplatense, que es cuando la nacionalidad de su artista es platense (Uruguay o Argentina). ¡Ojo con repetir lógica! 

nacionalidad(elsaBornemann, argentina).
nacionalidad(joseHernandez, argentina).
nacionalidad(julioCortazar, argentina).
nacionalidad(jorgeLuisBorges, argentina).
nacionalidad(horacioQuiroga, uruguaya).
nacionalidad(neilGaiman, britanica).
nacionalidad(alanMoore, britanica).
nacionalidad(warrenEllis, britanica).
nacionalidad(terryPratchett, britanica).
nacionalidad(brianAzarello, estadounidense).
nacionalidad(frankMiller, estadounidense).
nacionalidad(stephenKing, estadounidense).
nacionalidad(isaacAsimov, rusa).

esRioplatense(Obra) :-
  escribio(Artista, Obra),
  nacionalidad(Artista, Nacionalidad),
  esNacionalidadPlatense(Nacionalidad).

esNacionalidadPlatense(uruguaya).
esNacionalidadPlatense(argentina).


% Para todas las obras que escribió un artista, la obra es un comic

soloEscribioComics(Artista) :-
  escribio(Artista, _),
  forall(escribio(Artista, Obra), esComic(Obra)).
%        ^^^^^^^^^^^^^^^^^^^^^^^  ^^^^^^^^^^^^^
%             antecedente          consecuente

% forall(escribio(Artista, Obra), esComic(Obra)). "Para toda obra que escribió X, X es un comic." / "X escribió sólo comics."
% forall(esComic(Obra), escribio(Artista, Obra)). "Para todo comic, lo escribió X." / "X escribió *todos* los comics."

%puedenSerAmigues(UnaPersona, OtraPersona) :-
%  esPersona(UnaPersona),
%  esPersona(OtraPersona),
%  UnaPersona \= OtraPersona,
%  forall(esAmigue(UnaPersona, UneAmigue), esAmigue(OtraPersona, UneAmigue)).

soloEscribioComicsOBestSellers(Artista) :-
  escribio(Artista, _),
  forall(escribio(Artista, Obra), esComicOBestSeller(Obra)).

esComicOBestSeller(Obra) :-
  esComic(Obra).

esComicOBestSeller(Obra) :-
  esBestSeller(Obra).

todasLasObrasSonComics :-
  forall(escribio(_, Obra), esComic(Obra)).
% escribio(neilGaiman, sandman), esComic(sandman)
% escribio(neilGaiman, buenosPresagios), esComic(buenosPresagios)
% escribio(elsaBornemann, socorro), esComic(socorro)
% escribio(alanMoore, watchmen), esComic(watchmen)
% ........


% Functores!

% componente(ingrediente, gramos)




esLibroCientifico(UnLibro) :-
  esDeTipo(UnLibro, cientifico(_)).


% novela(Genero, CantidadDeCapitulos)
% libroDeCuentos(CantidadDeCuentos)
% libroCientifico(Disciplina)
% bestSeller(Precio, CantidadDePaginas)

esDeTipo(it, novela(terror, 11)).
esDeTipo(cuentosDeLaSelva, libroDeCuentos(10)).
esDeTipo(elUniversoEnUnaTabla, cientifico(quimica)).
esDeTipo(elUltimoTeoremaDeFermat, cientifico(matematica)).
esDeTipo(yoRobot, bestSeller(700, 253)).

/*
estaBuena/1 nos dice cuando una obra está buena. Esto sucede cuando:
- Es una novela policial y tiene menos de 12 capítulos.
- Es una novela de terror.
- Los libros con más de 10 cuentos siempre son buenos.
- Es una obra científica de fisicaCuantica.
- Es un best seller y el precio por página es menor a $50.
*/ 

% Polimorfismo

estaBuena(Obra) :-
  esDeTipo(Obra, Tipo),
  esCopado(Tipo).

esCopado(novela(policial, CantidadDeCapitulos)) :-
  CantidadDeCapitulos < 12.

esCopado(novela(terror, _)).

esCopado(libroDeCuentos(CantidadDeCuentos)) :-
  CantidadCuentos > 10.

esCopado(libroCientifico(fisicaCuantica)).

esCopado(bestSeller(Precio, CantidadPaginas)) :-
  (Precio / CantidadPaginas) < 50.