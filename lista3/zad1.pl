% lista,C- licznik,S - suma
suma([],0,0).
suma([H|R],C,S) :-
    suma(R,X,Y),
    C is X + 1,
    S is Y + H.
% lista, X - wartosc oczekiwana, S - srednia
wariancja(L,X) :-
    suma(L,C,Y),
    S is Y / C,
    pom(L,S,W),
    X is W / C.
% lista,S- srednia,W-  suma odchylen
pom([],_,0).
pom([H|R],S,W) :-
    pom(R,S,Y),
    W is Y + (S - H)^2 .







