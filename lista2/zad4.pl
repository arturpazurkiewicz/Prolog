% zaawansowane zasady
regula(X,*,_,0) :-
    number(X),
    X =:= 0,
    !.
regula(_,*,Y,0) :-
    number(Y),
    Y =:= 0,
    !.
regula(X,*,Y,Y) :-
    number(X),
    X =:= 1,
    !.
regula(X,*,Y,X) :-
    number(Y),
    Y =:= 1,
    !.
regula(X,/,X,1) :-
    !.
regula(X,+,Y,Y) :-
    number(X),
    X =:= 0,
    !.
regula(X,+,Y,X) :-
    number(Y),
    Y =:= 0,
    !.
regula(X,-,X,0) :-
    !.
regula(X,-,Y,-Y) :-
    number(X),
    X =:= 0,
    !.
regula(X,-,Y,X) :-
    number(Y),
    Y =:= 0,
    !.
% reguła na przestawianie miejscami (podstawowa):-
regula(X,/,Y,Z) :-
    X = Y * Z
    ; X = Z * Y
    ; (X = Z1 * Y * Z2, Z = Z1*Z2),
    !.
regula(X,*,Y,Z) :-
    X = Z / Y
    ; Y = Z / X
    ; (X = Z1 / Y * Z2, Z = Z1*Z2)
    ; (Y = Z1 / Y * Z2, Z = Z1*Z2)
    ; (X = Z1 / Y / Z2, Z = Z1/Z2)
    ; (Y = Z1 / Y / Z2, Z = Z1/Z2),
    !.
regula(X,+,Y,Z) :-
    X = Z - Y
    ; Y = Z - X
    ; (X = Z1 - Y + Z2, Z = Z1+Z2)
    ; (Y = Z1 - X + Z2, Z = Z1+Z2)
    ; (X = Z1 - Y - Z2, Z = Z1-Z2)
    ; (Y = Z1 - X - Z2, Z = Z1-Z2),
    !.
regula(X,-,Y,Z) :-
     X = Z + Y
    ; Y = Z + X
    ; (X = Z1 + Y - Z2, Z = Z1-Z2)
    ; (Y = Z1 + X - Z2, Z = Z1-Z2)
    ; (X = Z1 + Y + Z2, Z = Z1+Z2)
    ; (Y = Z1 + X + Z2, Z = Z1+Z2),
    !.

% podstawowe zasady
regula(X,S,Y,Z) :-
    Z =..[S,X,Y].

% L- lewa strona, P - prawa strona, W - wynik, S - znak

uprosc(Wyr,W):-
    Wyr =..[S,L,P],
    uprosc(L,L1),
    uprosc(P,P1),
    regula(L1,S,P1,W),
    write(S),
    !.
uprosc(X,X).
