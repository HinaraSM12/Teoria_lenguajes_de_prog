% HECHOS NUEVOS (No Borrar)
% HECHOS NUEVOS
link(a,b,carro,5).
link(a,c,avion,10).
link(b,d,carro,5).
link(c,d,bus,3).
link(c,f,moto,1).
link(d,e,carro,5).
link(d,f,bus,3).
link(f,e,avion,10).

%1a Recorrer el grafo y devolver la lista de la ruta tomada
ruta(A,B,M):- B==A, M=[A], !.
ruta(A,B,M):- link(A,B,_,_), M=[A,B], !.
%unicamente 2 rutas
ruta(A,B,M):- link(A,X,avion,_), link(X,B,bus,_), M=[A,X,B].
ruta(A,B,M):- link(A,X,carro,_), link(X,B,carro,_), M=[A,X,B].
ruta(A,B,M):- link(A,X,avion,_), link(X,B,moto,_), M=[A,X,B].
ruta(A,B,M):- link(A,X,carro,_), link(X,B,bus,_), M=[A,X,B].
ruta(A,B,M):- link(A,X,bus,_), link(X,B,carro,_), M=[A,X,B].
ruta(A,B,M):- link(A,X,bus,_), link(X,B,avion,_), M=[A,X,B].
ruta(A,B,M):- link(A,X,moto,_), link(X,B,avion,_), M=[A,X,B].
ruta(A,B,M):- link(A,X,carro,_), link(X,B,bus,_), M=[A,X,B].
%3 rutas
ruta(A,B,M):- link(A,X,avion,_), link(X,Y,bus,_), link(Y,B,bus,_), M=[A,X,Y,B].
ruta(A,B,M):- link(A,X,avion,_), link(X,Y,bus,_), link(Y,B,carro,_), M=[A,X,Y,B].
ruta(A,B,M):- link(A,X,avion,_), link(X,Y,moto,_), link(Y,B,avion,_), M=[A,X,Y,B].
ruta(A,B,M):- link(A,X,carro,_), link(X,Y,carro,_), link(Y,B,carro,_), M=[A,X,Y,B].
ruta(A,B,M):- link(A,X,carro,_), link(X,Y,carro,_), link(Y,B,bus,_), M=[A,X,Y,B].
ruta(A,B,M):- link(A,X,bus,_), link(X,Y,bus,_), link(Y,B,avion,_), M=[A,X,Y,B].
ruta(A,B,M):- link(A,X,carro,_), link(X,Y,bus,_), link(Y,B,avion,_), M=[A,X,Y,B].
%4rutas
ruta(A,B,M):- link(A,X,avion,_), link(X,Y,bus,_), link(Y,Z,bus,_), link(Z,B,avion,_), M=[A,X,Y,Z,B].
ruta(A,B,M):- link(A,X,carro,_), link(X,Y,carro,_), link(Y,Z,bus,_), link(Z,B,avion,_), M=[A,X,Y,Z,B].
%1b Recorrer el grafo y devolver la suma de los pesos de la ruta tomada
peso(A,B,M):- B==A, M=0, !.
peso(A,B,M):- link(A,B,_,Q), M is Q,!.
%unicamente 2 rutas
peso(A,B,M):- link(A,X,avion,Q), link(X,B,bus,R), M is Q+R.
peso(A,B,M):- link(A,X,carro,Q), link(X,B,carro,R), M is Q+R.
peso(A,B,M):- link(A,X,avion,Q), link(X,B,moto,R), M is Q+R.
peso(A,B,M):- link(A,X,carro,Q), link(X,B,bus,R), M is Q+R.
peso(A,B,M):- link(A,X,bus,Q), link(X,B,carro,R), M is Q+R.
peso(A,B,M):- link(A,X,bus,Q), link(X,B,avion,R), M is Q+R.
peso(A,B,M):- link(A,X,moto,Q), link(X,B,avion,R), M is Q+R.
peso(A,B,M):- link(A,X,carro,Q), link(X,B,bus,R), M is Q+R.
%3 rutas
peso(A,B,M):- link(A,X,avion,Q), link(X,Y,bus,R), link(Y,B,bus,S), M is Q+R+S.
peso(A,B,M):- link(A,X,avion,Q), link(X,Y,bus,R), link(Y,B,carro,S), M is Q+R+S.
peso(A,B,M):- link(A,X,avion,Q), link(X,Y,moto,R), link(Y,B,avion,S), M is Q+R+S.
peso(A,B,M):- link(A,X,carro,Q), link(X,Y,carro,R), link(Y,B,carro,S), M is Q+R+S.
peso(A,B,M):- link(A,X,carro,Q), link(X,Y,carro,R), link(Y,B,bus,S), M is Q+R+S.
peso(A,B,M):- link(A,X,carro,Q), link(X,Y,bus,R), link(Y,B,avion,S), M is Q+R+S.
peso(A,B,M):- link(A,X,bus,Q), link(X,Y,bus,R), link(Y,B,avion,S), M is Q+R+S.
%4rutas
peso(A,B,M):- link(A,X,avion,Q), link(X,Y,bus,R), link(Y,Z,bus,S), link(Z,B,avion,T), M is Q+R+S+T.
peso(A,B,M):- link(A,X,carro,Q), link(X,Y,carro,R), link(Y,Z,bus,S), link(Z,B,avion,T), M is Q+R+S+T.

%1c Recorrer el grafo y devolver la lista de los tipos de la ruta tomada
tipo(A,B,M):- B==A, M=[], !.
tipo(A,B,M):- link(A,B,Q,_), M=[Q], !.
%unicamente 2 rutas
tipo(A,B,M):- link(A,X,Q,10), link(X,B,R,3), M=[Q,R].
tipo(A,B,M):- link(A,X,Q,5), link(X,B,R,5), M=[Q,R].
tipo(A,B,M):- link(A,X,Q,10), link(X,B,R,1), M=[Q,R].
tipo(A,B,M):- link(A,X,Q,5), link(X,B,R,3), M=[Q,R].
tipo(A,B,M):- link(A,X,Q,3), link(X,B,R,5), M=[Q,R].
tipo(A,B,M):- link(A,X,Q,3), link(X,B,R,10), M=[Q,R].
tipo(A,B,M):- link(A,X,Q,1), link(X,B,R,10), M=[Q,R].
tipo(A,B,M):- link(A,X,Q,5), link(X,B,R,3), M=[Q,R].
%3 rutas
tipo(A,B,M):- link(A,X,Q,10), link(X,Y,R,3), link(Y,B,S,3), M=[Q,R,S].
tipo(A,B,M):- link(A,X,Q,10), link(X,Y,R,3), link(Y,B,S,5), M=[Q,R,S].
tipo(A,B,M):- link(A,X,Q,10), link(X,Y,R,1), link(Y,B,S,10), M=[Q,R,S].
tipo(A,B,M):- link(A,X,Q,5), link(X,Y,R,5), link(Y,B,S,5), M=[Q,R,S].
tipo(A,B,M):- link(A,X,Q,5), link(X,Y,R,5), link(Y,B,S,3), M=[Q,R,S].
tipo(A,B,M):- link(A,X,Q,5), link(X,Y,R,3), link(Y,B,S,10), M=[Q,R,S].
tipo(A,B,M):- link(A,X,Q,3), link(X,Y,R,3), link(Y,B,S,10), M=[Q,R,S].
%4rutas
tipo(A,B,M):- link(A,X,Q,10), link(X,Y,R,3), link(Y,Z,S,3), link(Z,B,T,10), M=[Q,R,S,T].
tipo(A,B,M):- link(A,X,Q,5), link(X,Y,R,5), link(Y,Z,S,3), link(Z,B,T,10), M=[Q,R,S,T].

%sumatoria con tail recursion
suma(N,R):- sumatoria(N,0,R).
sumatoria(1,A,Q) :- factorial(1,M),Q is A+1/M,!.
sumatoria(N, A, Resultado) :-N>1, N1 is N-1, factorial(N,R), Acum is (N^2+N-1)/R+A, sumatoria(N1, Acum, Resultado).
    
factorial(0,2).
factorial(N, R) :- factorial(N+2, 1, R).
factorial(0, R, R) :- !.
factorial(N, A, R) :- N > 0 , N1 is N - 1, A1 is A * N, factorial(N1, A1, R).

%NO BORRAR

isEqual(A,B):- A==B.
ope(N,E,R):- isEqual(N,1),ruta(a,E,A),sort(0,@=<,[A], R).
ope(N,E,R):- isEqual(N,2),peso(a,E,A),sort(0,@=<,[A], R).
ope(N,E,R):- isEqual(N,3),tipo(a,E,A),sort(0,@=<,[A], R).
ope(N,_,R):- isEqual(N,4),suma(2,R).
ope(N,_,R):- isEqual(N,5),suma(3,R).
ope(N,_,R):- isEqual(N,6),suma(4,R).
ope(N,_,R):- isEqual(N,7),suma(5,R).
ope(N,_,R):- isEqual(N,8),suma(6,R).
ope(N,_,R):- isEqual(N,9),suma(7,R).
ope(N,_,R):- isEqual(N,10),suma(8,R).



main:- 
    read(N),read(E),findall(R,ope(N,E,R),L), sort(0,@=<,L, L1),write(L1), halt.
:-main.