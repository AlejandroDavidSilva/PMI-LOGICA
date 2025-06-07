%---------------------PMI----------------------

%biblioteca_libros_libres[ ]
%biblioteca_libros_ocupados[ ] %bilbioteca tiene toodos los libros y lleva el registro de libros prestados.


%-------------------------------LIBROS------------------------------------------------------------
%libro(l1).
%libro(l2).
%libro(l3).
%libro(l4).
%libro(l5).
%libro(l6).
%libro(l7).
%libro(l8).
%libro(l9).
%libro(l10).

%todos los libros creados, son los recomenda la profesora

listaLibros([l1,l2,l3,l4,l5,l6,l7,l8,l9,l10]).
%-------------------------------------------------------------------------------------------

%----------------------------ALUMNOS---------------------------------------------------------------
%alumno(a1).
%alumno(a2).
%alumno(a3).
%alumno(a4).
%alumno(a5).
%todos los alumnos estan matriculados
%-------------------------------------------------------------------------------------------


alumnos([a1,a2,a3,a4,a5]).

%---------------------------------PREFERENCIAS------------------------------------------
preferencia(a1,l1).
preferencia(a1,l5).
preferencia(a1,l7).

preferencia(a2,l5).
preferencia(a2,l4).
preferencia(a2,l9).

preferencia(a3,l1).
preferencia(a3,l2).
preferencia(a3,l3).

%-------------------------------------------------------------------------------------------



%QUE PASA SI ALUMNO SOLO ME DA 2 O 4 O MAS DE 4 RECOMENDACIONES DE LIBRO, DEBO REALIZAR OTRO PREDICADO?

%------------------------------------LIBRO ASIGNADO-------------------------------------------------------
%libro_asignado(a1,l1).
%libro_asignado(a2,l7).
%libro_asignado(a3,l3).
%libro_asignado(a2,l8).

%-------------------------------------------------------------------------------------------

%------------------------------------LIBRO PRESTADO-------------------------------------------------------
prestado(l1).
prestado(l2).
prestado(l3).
prestado(l8).
%-------------------------------------------------------------------------------------------


%-------------------------------------REGLAS------------------------------------------------------
%preferencia_alumno(ALUMNO,LIBRO) :- preferencia(ALUMNO,LIBRO).

%libro_prestado(LIBRO) :- prestado(LIBRO).

siguiendo_curso(X) :- preferencia(X, _).

asignacionLibro_valida(Alumno, Libro) :-
    alumno(Alumno),
    libro(Libro),
    preferencia(Alumno, Libro),  % aca verifica que haya dado preferencia, x lo tanto, sigue cursando
    not(prestado(Libro)).



no_asignado(_,[]).
no_asignado(Libro, [LibroAsignado|RestoLibros]):-
                   Libro \= LibroAsignado,
                   no_asignado(Libro, RestoLibros).

agregar_libro(Libro, LibrosAsignados, [Libro|LibrosAsignados]).

%-------------------------------------Funcion MIEMBRO------------------------------------------------------
miembo(X,[X|_]).
miembro(X,[_|Y]) :- miembro(X,Y).

%----------------------------------------------------------------------------------------------------------------

%-------------------------------------Funcion QUITAR LIBRO------------------------------------------------------
quitarLibro(_,[],[]).
quitarLibro(Libro, [LibroCabeza|RestoListaLibros], ListaLibrosModif):-
    Libro\=LibroCabeza,                                         %l5  [] --> [l1,l2,l3,l4,l6,l7,l8,l9,l10]+[]
    quitarLibro(Libro,RestoListaLibros,[LibroCabeza|ListaLibroModif]).
quitarLibro(Libro, [LibroCabeza|RestoListaLibros] , ListaLibroModif ):-
    quitarLibro(Libro, RestoListaLibros, ListaLibroModif).


%----------------------------------------------------------------------------------------------------------------

generar_asignaciones([], [], _).  % caso base: sin alumnos, sin asignaciones, caso en el que corta la iteracion recursiva
generar_asignaciones([Alumno | RestoAlumnos], [(Alumno, Libro) | RestoAsignaciones], ListaLibros):-
    preferencia(Alumno, Libro),
    miembro(Libro,ListaLibros),
    (not(prestado(Libro))),
    quitarLibro(Libro, ListaLibros, ListaLibrosMODIF),                                            %([l1,l2,l3,l4,l5,l6,l7,l8,l9,l10]). --> ([l1,l2,l3,l4,l6,l7,l8,l9,l10]).
    generar_asignaciones(RestoAlumnos, RestoAsignaciones, ListaLibrosMODIF).
generar_asignaciones([Alumno | RestoAlumnos], RestoAsignaciones, ListaLibros):-
     generar_asignaciones(RestoAlumnos, RestoAsignaciones, ListaLibros).
    
    



   /*
    armarLista(listaLibros_sugeridos_profe)
    asignacionLibro_valida(Alumno, Libro),
    no_asignado(Libro, LibrosAsignados);
    not(agregar_libro(Libro, LibrosAsignados, LibrosAsignados2)),
    generar_asignaciones(RestoAlumnos, RestoAsignaciones, LibrosAsignados2).


generar_asignaciones([], _, _).  % caso base: sin alumnos, sin asignaciones, caso en el que corta la iteracion recursiva
generar_asignaciones([Alumno | RestoAlumnos], [(Alumno, Libro) | RestoAsignaciones], [Libro, RestoLibros]):-
                             asignacionLibro_valida(Alumno, Libro),

              */
              
              
              
/*
solucion(Alumnos , P , M ):-
                 alumnos(A),
                 listaLibros(L),                        %L es una lista de libros sin asignar aun
                 generar_asignaciones(A ,Alumnos, L ),  %la lista que le paso a la funcion es una copia de la lista, no es la lista por direccion
                 calcular_Porcentaje(A, P),
                 calcular_Media(A, M ).

  */
solucion(Alumnos):-
                 alumnos(A),
                 listaLibros(L),
                 generar_asignaciones(A ,Alumnos, L ).

    
%-------------------------------------------------------------------------------------------
