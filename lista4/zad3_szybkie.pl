male(Licznik,Wynik):-
    (   (R1 = [1,4,5,8], I1=1);(R1= [], I1=0)),
    (   (union(R1,[2,5,6,9],R2), I2 is I1+1);(R2= R1, I2=I1)),
    (   (union(R2,[3,6,7,10],R3), I3 is I2+1);(R3= R2, I3=I2)),
    (   (union(R3,[8,11,12,15],R4), I4 is I3+1);(R4= R3, I4=I3)),
    (   (union(R4,[9,12,13,16],R5), I5 is I4+1);(R5= R4, I5=I4)),
    (   (union(R5,[10,13,14,17],R6), I6 is I5+1);(R6= R5, I6=I5)),
    (   (union(R6,[15,18,19,22],R7), I7 is I6+1);(R7= R6, I7=I6)),
    (   (union(R7,[16,19,20,23],R8), I8 is I7+1);(R8= R7, I8=I7)),
    (   (union(R8,[17,20,21,24],Wynik), L is I8+1);(Wynik= R8, L=I8)),
    Licznik >= L.


srednie(R0,Licznik,R4):-
    K1 = [1,2,4,6,11,13,15,16],
    K2 = [2,3,5,7,12,14,16,17],
    K3 = [8,9,11,13,18,20,22,23],
    K4 = [9,10,12,14,19,21,23,24],
    (   intersection(K1,R0,K1) -> (R1 = R0, I1=1);((union(R0,K1,R1), I1=1);(R1 = R0, I1=0))),
    (   intersection(K2,R1,K2) -> (R2 = R1, I2 is I1+1);((union(R1,K2,R2), I2 is I1+1);(R2 = R1, I2=I1))),
    (   intersection(K3,R2,K3) -> (R3 = R2, I3 is I2+1);((union(R2,K3,R3), I3 is I2+1);(R3 = R2, I3=I2))),
    (   intersection(K4,R3,K4) -> (R4 = R3, L is I3+1);((union(R3,K4,R4), L is I3+1);(R4 = R3, L=I3))),
    Licznik >=L.

duze(Lista,Licznik,Wynik) :-
    K0 = [1,2,3,4,7,11,14,18,21,22,23,24],
    (   intersection(K0,Lista,K0) -> (L = 1,Wynik = Lista); ((L = 0, Wynik = Lista); L = 1, union(Lista,K0,Wynik))),
    Licznik >=L.

male_wer(I9,W):-
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
    (   intersection(K9,W,K9) -> I9 is 1 + I8; I9 = I8).

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


zapalki(Zabrane,K):-
    kwadraty(K,D,S,M),
    male(M,R1),
    srednie(R1,S,R2),
    duze(R2,D,R3),
    length(R3,L),
    Zabrane is 24 - L,
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
