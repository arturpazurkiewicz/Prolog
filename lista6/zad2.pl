:- consult(zad1),consult(interpreter).


wykonaj(NazwaPliku):-
    open(NazwaPliku,read,X),
    scanner(X,Y),
    close(X),
    phrase(program(Z), Y),
    interpreter(Z).
