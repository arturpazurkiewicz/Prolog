:- module(solver, [solve/4]).
:- use_module(library(clpfd)).

solve(Tiles, Board,X,Y) :-
    length(PN,X),
    board(X,Y,_,PN,[],[],Board),
    tuples_in(Board,Tiles).
   % board(Board),
    %insert(Board,Tiles).


board([[_ ,E1,S1,_ ], [_ ,E2,S2,E1], [_ ,_ ,S3,E2],
       [S1,E4,S4,_ ], [S2,E5,S5,E4], [S3,_ ,S6,E5],
       [S4,E7,_ ,_ ], [S5,E8,_ ,E7], [S6,_ ,_ ,E8]]).

% X, Y, Ostatni wschod, Wczesniejsze polnoce, Aktualne polnoce,
% Pomocniczy wynik, Wynik, Kafelki
board(_,1,_,[],_,W,W):- !.
board(X,Y,_,[],AN,PW,W):-
    Y1 #= Y -1,
    board(X,Y1,_,AN,[],PW,W),
    !.
board(X,Y,OE,[WP1|WP2],AP,PW,Wyn):-
    PW1 = [N,E,S,W],
    PW1 ins 0..9,
    N #= WP1,
    W #= OE,
    not_same(PW,PW1),
    append(AP,[S],AP1),
    append(PW,[PW1],PW2),
    board(X,Y,E,WP2,AP1,PW2,Wyn).

insert([], []).
insert([B | Bs], Tiles) :-
    select(B, Tiles, Rest),
    insert(Bs, Rest).

not_same([],_).
not_same([H|R],[N1,E1,S1,W1]):-
    [N,E,S,W] = H,
    N #\= N1 #\/ E #\= E1 #\/ S #\= S1 #\/ W #\= W1,
    not_same(R,[N1,E1,S1,W1]).
