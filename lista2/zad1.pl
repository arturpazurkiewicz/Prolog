# ilosc od 1
ilosc([_|L],I):-
    ilosc(L,J),
    I is J + 1,
    !.
ilosc([_|_],I):-
    I is 1.

srodkowy(L,X):-
    ilosc(L,I),
    K is round(I/2),
    K =:= (I/2)+0.5,
    nth1(K,L,X).

