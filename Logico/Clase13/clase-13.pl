% Punto 1
todosSiguenA(Rey) :-
  personaje(Rey),
  forall(personaje(Personaje), sigueA(Personaje, Rey)).

sigueA(Alguien, Alguien).
sigueA(lyanna, jon).
sigueA(jorah, daenerys).
%% etc

% Punto 2

ciudadInteresante(Ciudad) :-
  antigua(Ciudad),
  cantidadLugaresCopadosEn(Ciudad, Cantidad),
  Cantidad > 10.

cantidadLugaresCopadosEn(Ciudad, Cantidad) :-
  lugaresCopadosEn(Ciudad, Lugares),
  length(Lugares, Cantidad).

lugaresCopadosEn(Ciudad, Lugares) :-
  findall(Lugar, esLugarCopadoEn(Ciudad, Lugar), Lugares).

esLugarCopadoEn(Ciudad, Lugar) :-
  puntoDeInteres(Lugar, Ciudad),
  esLugarCopado(Lugar).

esLugarCopado(museo(cienciasNaturales)).

esLugarCopado(bar(CantidadVariedadesCervezas)) :-
  CantidadVariedadesCervezas > 4.

puntoDeInteres(bar(5), buenosAires).
puntoDeInteres(museo(cienciasNaturales), buenosAires).
puntoDeInteres(museo(astronomia), buenosAires).
puntoDeInteres(museoConBar(astronomia, 6), buenosAires).

% Punto 3

inFraganti(Delito, Delincuente) :-
  cometio(Delito, Delincuente),
  findall(Testigo, testigo(Delito, Testigo), Testigos),
  length(Testigos, Cantidad),
  Cantidad > 0.

inFraganti(Delito, Delincuente) :-
  cometio(Delito, Delincuente),
  testigo(Delito, _).

% Punto 4

viejoMaestro(Pensador) :-
  pensamiento(Pensador, _),
  forall(pensamiento(Pensador, Pensamiento), llegaANuestrosDias(Pensamiento)).

? viejoMaestro(socrates).
% true / false
? viejoMaestro(Pensador).
% Pensador = socrates,
% Pensador = arquimedes,
% ......

% Punto 5

numeroDeLaSuerte(Persona, Numero) :-
  diaDelNacimiento(Persona, Numero).

numeroDeLaSuerte(joaquin, 8).

% Punto 6

obraMaestra(Compositor, Obra) :-
  compositor(Compositor, Obra),
  forall(movimiento(Obra, Movimiento), esMovimientoMaestro(Movimiento)).

% Punto 7
puedeComer(analia, Comida) :-
  ingrediente(Comida, _),
  forall(ingrediente(Comida, Ingrediente), esIngredienteVegano(Ingrediente)).

puedeComer(evaristo, asado).


esIngredienteVegano(Ingrediente) :-
  not(contieneProductosAnimales(Ingrediente)).

contieneProductosAnimales(Ingrediente) :-
  contieneCarne(Ingrediente).

contieneProductosAnimales(Ingrediente) :-
  contieneHuevo(Ingrediente).

contieneProductosAnimales(Ingrediente) :-
  contieneLeche(Ingrediente).

% Punto 8
costoEnvio(Paquete, PrecioTotal) :-
  precioItemPaquete(Paquete, _),
  findall(PrecioItem, precioItemPaquete(Paquete, PrecioItem), Precios),
  sumlist(Precios, PrecioTotal).

precioItemPaquete(Paquete, Precio) :-
  itemPaquete(Paquete, Item),
  precioItem(Item, Precio).

precioItem(libro(Precio), Precio).

precioItem(mp3(_, Duracion), Precio) :-
  Precio is Duracion * 0.42.

precioItem(productoEnOferta(_, PrecioOferta), PrecioOferta).
