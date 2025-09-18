% ==============================================
%  SISTEMA EXPERTO: RECOMENDADOR DE VIAJES
% ==============================================

% --------- Datos de destinos ----------
destino(cancun, playa, alto, calido).
destino(tulum, playa, medio, calido).
destino(acapulco, playa, bajo, calido).
destino(bariloche, montana, medio, frio).
destino(machu_picchu, cultura, medio, templado).
destino(paris, ciudad, alto, templado).
destino(tokio, ciudad, alto, templado).
destino(chichen_itza, cultura, bajo, calido).
destino(cusco, cultura, medio, frio).
destino(sierra_nevada, montana, bajo, frio).

% --------- Alertas que impiden el viaje ----------
alerta(temporada_huracanes, playa, calido).
alerta(nieve_extrema, montana, frio).

hay_alerta(Tipo, Clima) :-
    alerta(temporada_huracanes, Tipo, Clima), !.
hay_alerta(Tipo, Clima) :-
    alerta(nieve_extrema, Tipo, Clima), !.

% --------- Reglas para encontrar destino ----------
recomendar(PrefTipo, Presupuesto, Clima, Destino) :-
    destino(Destino, PrefTipo, Presupuesto, Clima),
    \+ hay_alerta(PrefTipo, Clima).

% --------- Plan de viaje ----------
plan(cancun, [
    'Hospedaje en hotel todo incluido',
    'Visitar Isla Mujeres y snorkel en arrecifes',
    'Vida nocturna en zona hotelera'
]).
plan(tulum, [
    'Visita a ruinas mayas',
    'Playa y cenotes',
    'Comida local en pueblo'
]).
plan(acapulco, [
    'Playa y paseo en yate',
    'Clavados en La Quebrada',
    'Mercado de artesanias'
]).
plan(bariloche, [
    'Excursion a Cerro Catedral',
    'Circuito Chico y Lago Nahuel Huapi',
    'Chocolate artesanal'
]).
plan(machu_picchu, [
    'Tren a Aguas Calientes',
    'Tour guiado por las ruinas',
    'Visitar mercados de Cusco'
]).
plan(paris, [
    'Torre Eiffel y Louvre',
    'Paseo por Sena',
    'Cafes y panaderias locales'
]).
plan(tokio, [
    'Visita a templos y jardines',
    'Recorridos de sushi y ramen',
    'Tecnologia y cultura pop'
]).
plan(chichen_itza, [
    'Tour arqueologico',
    'Cenote Ik Kil',
    'Comida yucateca'
]).
plan(cusco, [
    'City tour y ruinas cercanas',
    'Valle Sagrado',
    'Museos y artesania'
]).
plan(sierra_nevada, [
    'Senderismo y paisajes nevados',
    'Cabanas rurales',
    'Gastronomia local'
]).

% --------- Orquestador principal ----------
viaje_recomendado(PrefTipo, Presupuesto, Clima) :-
    recomendar(PrefTipo, Presupuesto, Clima, Destino),
    format('Destino recomendado: ~w~n', [Destino]),
    plan(Destino, Actividades),
    format('Plan sugerido:~n'),
    listar(Actividades).

listar([]).
listar([H|T]) :-
    format('- ~w~n', [H]),
    listar(T).
