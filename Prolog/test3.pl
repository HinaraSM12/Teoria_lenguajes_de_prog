/* son del Signo los nacidos entre el DiaIni/MesIni y el DiaFin/MesFin */
horoscopo(aries,21,3,21,4).
horoscopo(tauro,21,4,21,5).
horoscopo(geminis,21,5,21,6).
horoscopo(cancer,21,6,21,7).
horoscopo(leo,21,7,21,8).
horoscopo(virgo,21,8,21,9).
horoscopo(libra,21,9,21,10).
horoscopo(escorpio,21,10,21,11).
horoscopo(sagitario,21,11,21,12).
horoscopo(capricornio,21,12,21,1).
horoscopo(acuario,21,1,21,2).
horoscopo(piscis,21,2,21,3).
mes(1,31).
mes(2,28).
mes(3,31).
mes(4,30).
mes(5,31).
mes(6,30).
mes(7,31).
mes(8,31).
mes(9,30).
mes(10,31).
mes(11,30).
mes(12,31).
/* signo(Dia,Mes,Signo) <- los nacidos el Dia/Mes pertenecen al signo Signo */
%Aca va su codigo para el horoscopo
signo(Dia,Mes,Signo) :- mes(Mes,X),Dia=<X, Dia>=21, horoscopo(Signo,_,Mes,_,_),!.
signo(Dia,Mes,Signo) :- mes(Mes,X), Dia=<X, Dia<21, horoscopo(Signo,_,_,_,Mes), !.
signo(Dia,Mes,Signo) :- mes(Mes,X), Dia>=X, Signo=("Dia invalido del mes",Mes), !.
signo(Dia,Mes,Signo) :- Dia=_, Mes>12, Signo="Mes Invalido", !.
signo(Dia,Mes,Signo) :- Dia=_, Mes=<0, Signo="Mes Invalido", !.
%Aca va su codigo para el factorial
factorial(0,1).
factorial(A,B) :- A>0, A1 is A-1, factorial(A1,R), B is A * R.
%Aca va su codigo de triangular recursivo
triang(1,1).
triang(A,B) :- A>1, A1 is A-1, triang(A1,R), B is A + R.
%Aca va su coigo de triangular con tail recursion
triangular(A,B):- triangular(A,1,B).
triangular(1,B,B):- !.
triangular(A,C,B):- A>1, A1 is A-1, CA is C + A, triangular(A1,CA,B).
% NO BORRAR
isEqual(A,B):- A==B.
ope(N,E,R):- isEqual(N,1),signo(24,E,R).
ope(N,E,R):- isEqual(N,2),signo(31,E,R).
ope(N,E,R):- isEqual(N,3),signo(1,E,R).
ope(N,E,R):- isEqual(N,4),signo(8,E,R).
ope(N,E,R):- isEqual(N,5),factorial(E,R).
ope(N,E,R):- isEqual(N,6),factorial(E,R).
ope(N,E,R):- isEqual(N,7),factorial(E,R).
ope(N,E,R):- isEqual(N,8),factorial(E,R).
ope(N,E,R):- isEqual(N,9),triang(E,R).
ope(N,E,R):- isEqual(N,10),triang(E,R).
ope(N,E,R):- isEqual(N,11),triangular(E,R).
ope(N,E,R):- isEqual(N,12),triangular(E,R).


main:- 
    read(N),read(E),ope(N,E,R), write(R), halt.
:-main.