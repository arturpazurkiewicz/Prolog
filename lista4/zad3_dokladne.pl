male_wer(Licznik,W):-
    K1 = [1,4,5,8],
    K2 = [2,5,6,9],
    K3 = [3,6,7,10],
    K4 = [8,11,12,15],
    K5 = [9,12,13,16],
    K6 = [10,13,14,17],
    K7 = [15,18,19,22],
    K8 = [16,19,20,23],
    K9 = [17,20,21,24],
    (   intersection(K1,W,K1) -> I1 is 1 ; I1 = 0),
    (   intersection(K2,W,K2) -> I2 is 1 + I1; I2 = I1),
    (   intersection(K3,W,K3) -> I3 is 1 + I2; I3 = I2),
    (   intersection(K4,W,K4) -> I4 is 1 + I3; I4 = I3),
    (   intersection(K5,W,K5) -> I5 is 1 + I4; I5 = I4),
    (   intersection(K6,W,K6) -> I6 is 1 + I5; I6 = I5),
    (   intersection(K7,W,K7) -> I7 is 1 + I6; I7 = I6),
    (   intersection(K8,W,K8) -> I8 is 1 + I7; I8 = I7),
    (   intersection(K9,W,K9) -> I9 is 1 + I8; I9 = I8),
    Licznik = I9.

srednie_wer(I4,R0):-
    K1 = [1,2,4,6,11,13,15,16],
    K2 = [2,3,5,7,12,14,16,17],
    K3 = [8,9,11,13,18,20,22,23],
    K4 = [9,10,12,14,19,21,23,24],
    (   intersection(K1,R0,K1) -> I1 = 1;I1=0),
    (   intersection(K2,R0,K2) -> I2 is I1 + 1 ; I2 = I1),
    (   intersection(K3,R0,K3) -> I3 is I2 + 1 ; I3 = I2),
    (   intersection(K4,R0,K4) -> I4 is I3 + 1 ; I4 = I3).


duze_wer(Licznik,Lista) :-
    K0 = [1,2,3,4,7,11,14,18,21,22,23,24],
    (   intersection(K0,Lista,K0) -> Licznik = 1 ; Licznik = 0).



kwadraty((duze(D), srednie(S), male(M)),D,S,M):-!.
kwadraty((srednie(S), male(M)),0,S,M):-!.
kwadraty((duze(D), male(M)),D,0,M):-!.
kwadraty((duze(D), srednie(S)),D,S,0):-!.
kwadraty(duze(D),D,0,0):-!.
kwadraty(srednie(S),0,S,0):-!.
kwadraty(male(M),0,0,M):-!.


zabierz(L,0,25,L).
zabierz(Lista,Usuniete,Iteracja,Wynik):-
    Iteracja < 25,
    (   append(Lista,[Iteracja],X),
    I is Iteracja +1,
    zabierz(X,Usuniete,I,Wynik))
    ;(Usuniete > 0,
    U is Usuniete -1,
    I is Iteracja + 1,
    zabierz(Lista,U,I,Wynik)).

zapalki(Zabrane,K):-
    kwadraty(K,D,S,M),
    between(0,24,Zabrane),
    zabierz([],Zabrane,1,R3),
    male_wer(M,R3),
    srednie_wer(S,R3),
    duze_wer(D,R3),
    write('Rozwiazanie:'),
    nl,
    rysuj(R3,1,0,true).

rysuj(_,25,_,_):-
    write('+'),
    nl,!.
rysuj(Lista,I,3,true):-
    write('+'),
    nl,
    rysuj(Lista,I,0,false),
    !.
rysuj(Lista,I,4,false):-
    nl,
    rysuj(Lista,I,0,true).
% poziomo
rysuj(Lista,I,C,true):-
    write('+'),
    (   member(I,Lista) -> write('---'); write('   ')),
    I1 is I + 1,
    C1 is C + 1,
    rysuj(Lista,I1,C1,true),
    !.
% pionowo
rysuj(Lista,I,C,false):-
    (   member(I,Lista) -> write('|   '); write('    ')),
    I1 is I + 1,
    C1 is C + 1,
    rysuj(Lista,I1,C1,false),
    !.
