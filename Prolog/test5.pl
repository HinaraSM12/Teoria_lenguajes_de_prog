/*Recursivo que calcula la cantidad de veces que un elemento está en una lista
    ejemplo 1: ocurrencias(2, [3,5,8,6,2,3,2,3,2], N) el resultado es N = 3
    ejemplo 2: ocurrencias(s, [d,a,d,g,g,s,d,f], N) el resultado es N = 1
*/
ocurrencias(_,[],0). 
ocurrencias(Elemento,[Cabeza|Cola],N) :- Elemento==Cabeza, ocurrencias(Elemento, Cola, N1), N is N1+1.
ocurrencias(Elemento,[Cabeza|Cola],N) :- Elemento\==Cabeza, ocurrencias(Elemento, Cola, N).
	

/*Recursivo que cuenta la cantidad de items que contiene una lista
    ejemplo 1: cantidad([3,5,8,6,2,3,2,3,2], N) el resultado es N = 9
    ejemplo 2: cantidad([d,a,d,g,g,s,d,f], N) el resultado es N = 8
*/
cantidad([],0). 
cantidad([_|Cola],Total) :-cantidad(Cola,A),Total is A+1.

/*Quita todas las ocurrencias de un elemento en una lista 
    ejemplo 1: quitar(2, [3,5,8,6,2,3,2,3,2], N) el resultado es N = [3,5,8,6,3,3]
    ejemplo 2: quitar(g, [d,a,d,g,g,s,d,f], N) el resultado es N = [d,a,d,s,d,f]
    */
quitar(_,[],[]). 
quitar(Elemento, [Cabeza|Cola], Res) :- Elemento==Cabeza, quitar(Elemento, Cola, Res).
quitar(Elemento, [Cabeza|Cola], Res) :- Elemento\==Cabeza, quitar(Elemento, Cola, A), Res=[Cabeza|A].



/* El podado es una técnica para limpiar las componentes de una red neuronal, 
una técnica de podado consiste en quitar según algún índice o métrica unos elementos
de un vector o matriz (Lista).

En un sentido simple, implemente una función para Quitar todos los elementos 
cuyo indice de ocurrencia o métrica de incidencia
(= Ocurrencia del Elemento en la Lista / Total Inicial de Elementos Lista) 
es mayor que 0.25

    ejemplo: podar([ok,tv, radio, tv, play, tv, tv, radio],8,Resp) el resultado es
    Resp = [ok, play]
    
    ejemplo: podar([5,5,7,4,1,2,4,7,8,5,1,2,1,1,2,1,2],17,Resp)
    el resultado es Resp = [5, 5, 7, 4, 2, 4, 7, 8, 5, 2, 2, 2] 
*/

podar([],_,[]):-!.
podar([H|T], Ncant, LRes):- ocurrencias(H,[H|T],N), R is N/Ncant, R>=0.25, quitar(H, [H|T], A), podar(A, Ncant, LRes).
podar([H|T], Ncant, LRes):- ocurrencias(H,[H|T],N), R is N/Ncant, R<0.25, podar(T, Ncant, LRes1), LRes=[H|LRes1].
    
/* Se encarga de enviar dinámicamente la cantidad de elementos
de una lista hacia podar */

podado(Lista, Resp):-
    cantidad(Lista, Ncant),
    podar(Lista, Ncant, Resp).
    
% punto 4 el enunciado:  
% HECHOS (No Borrar)
link(fuyuki, konoha, chocobo, 16300).
link(fuyuki,hinazawa,nube_voladora,7000).
link(fuyuki,berlin,nube_voladora,12000).
link(fuyuki,pendragon,mecha,90800).
link(konoha,egoland,mecha,8560).
link(konoha,kiev,nube_voladora,8500).
link(konoha,pendragon,mecha,90800).
link(hinazawa,minas_tirith,nube_voladora,8000).
link(minas_tirith,egoland,camello,2000).
link(minas_tirith,pendragon,mecha,90800).
link(egoland,pendragon,mecha,90800).
link(kiev,pendragon,mecha,90800).
link(berlin,pendragon,mecha,90800).

enrutar(A,A,[A],[],0,[]).
enrutar(A,B,M,Pp,P,T):- link(A,C,T1,P1), enrutar(C,B,M1,Pp2,P2,T2), M=[A|M1], P is P1+P2, Pp=[P1|Pp2], T=[T1|T2].


%%Se le pide implementar otra regla para contar lo elementos de una lista pero para una lista 3x3x3(regla size),
%Tambien se le pide sumar los elemtos de una lista 3x3x3(regla iterate)
%Para al final utilizar las funciones creadas en el vpl para calular el promedio de los elementos de la lista 3x3x3:

size([],R,R).
size([[H|T1]|T],Ac,R) :- size([H|T1],Ac,R1), size(T,R1,R),!.
size([[[H|T2]|T1]|T],Ac,R) :- size([H|T2],Ac,R1),size(T1,Ac,R1), size(T,R1,R),!.
size([_|T],Ac,R) :- A1 is Ac+1, size(T,A1,R).
   
iterate([],R,R).
iterate([[H1|T1]|T],Ac,R) :- iterate([H1|T1],Ac,R1), iterate(T,R1,R),!.
iterate([[[H|T2]|T1]|T],Ac,R) :- iterate([H|T2],Ac,R1),iterate(T1,Ac,R1), iterate(T,R1,R),!.
iterate([H1|T],Ac,R) :- A1 is Ac+H1, iterate(T,A1,R).
    
promedio(X,R):-iterate(X,0,A), size(X,0,B),R is A/B.

% A continunacion implemente la regla del punto 5

pot(X,N,R):- den(X,N,1,R).
den(X,1,A,R):-R is X*A,!.
den(X,N,A,R):- N1 is N-1, A1 is A*X, den(X,N1,A1,R).
frac1(N,X,R):- A is 2*N+1, den2(N,X,A,R).
den2(1,X,A,R):- R is 1-(X/(A)), !.
den2(N,X,A,R):- pot(X,N,P), N1 is N-1, Acum is (2*N-1)-P/(A), den2(N1,X,Acum,R).

%añadir aca la funcion para resolver el sudoku
%HECHOS
num(1). num(2). num(3). num(4).
%REGLAS
unicos(P,Q,R,S) :- num(P), num(Q), num(R), num(S),
\+ P=Q, \+ P=R, \+ P=S, \+ Q=R, \+ Q=S, \+ R=S.

sudoku(R11, R12, R13, R14, R21, R22, R23, R24, R31, R32, R33, R34, R41, R42, R43, R44) :- 
%columnas
unicos(R11, R21, R31, R41), unicos(R12, R22, R32, R42), unicos(R13, R23, R33, R43), unicos(R14, R24, R34, R44), 
%filas
unicos(R11,R12,R13,R14), unicos(R21,R22,R23,R24), unicos(R31,R32,R33,R34), unicos(R41,R42,R43,R44), 
%cuadrantes
unicos(R11,R12,R21,R22), unicos(R13,R14,R23,R24), unicos(R31,R32,R41,R42), unicos(R33,R34,R43,R44).

/*NO MODIFICAR: Hecho Principal*/
prueba(N,E,L,R):-N < 5,ocurrencias(E, L, R1),cantidad(L, R2),quitar(E,L,R3),podado(L,R4), R = ['ocurrencias',R1,'cantidad',R2,'quitar',R3,'podado',R4].
prueba(N,_,L,R):- N ==5, promedio(L,R).
prueba(N,E,L,R):- N ==6, frac1(L,E,R).
prueba(N,E,L,R):- N ==7, frac1(L,E,R).
prueba(N,E,L,R):- N ==8, frac1(L,E,R).
prueba(N,E,L,R):- N ==12, enrutar(E,L,A,_,_,_),sort(0,@=<,A, R).
prueba(N,E,L,R):- N ==13, enrutar(E,L,_,A,_,_),sort(0,@=<,A, R).
prueba(N,E,L,R):- N ==14, enrutar(E,L,_,_,_,A),sort(0,@=<,A, R).
prueba(N,E,L,R):- N ==15, enrutar(E,L,_,_,A,_),sort(0,@=<,[A], R).
prueba(N,_,_,R):- N == 16,sudoku(R11,R12,1,R14,
                                  R21,1,R23,2, 
                                  R31,R32,R33,3,
                                  R41,R42,4,R44),R = [R11,R12,R14,R21,R23,R31,R32,R33,R41,R42,R44].

/*Hecho Principal*/
main:-
    read(N),read(E),read(L),findall(R,prueba(N,E,L,R),L1), sort(0,@=<,L1, L2),write(L2), halt.
:-main. 