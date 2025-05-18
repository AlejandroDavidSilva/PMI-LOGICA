%---------------------PMI----------------------

%biblioteca_libros_libres[ ]
%biblioteca_libros_ocupados[ ] %bilbioteca tiene toodos los libros y lleva el registro de libros prestados.


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

%listaLibros_sugeridos_profe[l1,l2,l3,l4,l5,l6,l7,l8,l9,l10].

alumno(a1).
alumno(a2).
alumno(a3).
alumno(a4).
alumno(a5).


%listaAlumnos(a1,a2,a3,a4,a5).


preferencia(a1,l1).
preferencia(a1,l5).
preferencia(a1,l7).

preferencia(a2,l5).
preferencia(a2,l4).
preferencia(a2,l9).

preferencia(a3,l1).
preferencia(a3,l2).
preferencia(a3,l3).



%QUE PASA SI ALUMNO SOLO ME DA 2 O 4 O MAS DE 4 RECOMENDACIONES DE LIBRO, DEBO REALIZAR OTRO PREDICADO?

libro_asignado(a1,l1).
libro_asignado(a2,l7).
libro_asignado(a3,l3).
libro_asignado(a2,l8).

prestado(l1).
prestado(l2).
prestado(l3).
prestado(l8).

%asignacion(a1,l1,l2)
%asignacion(a2,l3,l4)
%asignacion(a3,l5,l6)
%asignacion(a4,l7,l8)
%asignacion(a5,l9,l10)

preferencia_alumno(ALUMNO,LIBRO) :- preferencia(ALUMNO,LIBRO).

libro_prestado(LIBRO) :- prestado(LIBRO).


