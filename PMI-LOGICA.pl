%---------------------PMI----------------------

biblioteca_libros_libres[ ]
biblioteca_libros_ocupados[ ] %bilbioteca tiene toodos los libros y lleva el registro de libros prestados.


libro(l1).
libro(l2).
libro(l3).
libro(l4).
libro(l5).
libro(l6).
libro(l7).
libro(l8).
libro(l9).
libro(l10).

listaLibros_sugeridos_profe[l1,l2,l3,l4,l5,l6,l7,l8,l9,l10].

alumno(a1).
alumno(a2).
alumno(a3).
alumno(a4).
alumno(a5).


listaAlumnos[a1,a2,a3,a4,a5].


%asignacion(a1,l1,l2)
%asignacion(a2,l3,l4)
%asignacion(a3,l5,l6)
%asignacion(a4,l7,l8)
%asignacion(a5,l9,l10)

preferencia(a1,l1).
preferencia(a2,l2).
preferencia(a3,l3).
% Como asumo si los alumnos restastes me dan o no preferencias? en base a ello es como defino mi base de conocimiento...


%Todos los casos de asignacion de libros, preferencias de libros, listado de libros y demas deben estar definidas en mi base de conocimiento?

preferencia(X,Y) :- alumno(X) , libro(Y).
