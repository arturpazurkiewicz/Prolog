:- use_module(library(clpfd)).
% rozmiary, szerokosc, wysokosc, tablica juz wstawionych, tablica
% wspolrzednych
%tablica juz wstawionych ma strukture elementow
% [X,Y,Rozmiar]
wkladanie_kwadratow([],_,_,[],[]):-
    !.
wkladanie_kwadratow([Roz|Reszta],Szerokosc,Wysokosc,[[S1,W1,Roz]|Wst],[S1,W1|Wsp]):-
    S #= Szerokosc - Roz,
    W #= Wysokosc - Roz,
    [S1] ins 0..S,
    [W1] ins 0..W,
    % sprawdzanie czy nie nachodzi na nic
    wkladanie_kwadratow(Reszta,Szerokosc,Wysokosc,Wst,Wsp),
    czy_nie_nachodzi(Wst,S1,W1,Roz).


czy_nie_nachodzi([],_,_,_):- !.
czy_nie_nachodzi([[X,Y,R]|Reszta],X1,Y1,R1):-
    nie_nachodzi(X,Y,R,X1,Y1,R1),
    czy_nie_nachodzi(Reszta,X1,Y1,R1).


nie_nachodzi(X,Y,R,X1,Y1,R1):-
    (
    (   X #=< X1 #/\ X + R #=< X1)
    #\/
    (X1 #=< X #/\ X1 + R1 #=< X)
    #\/
    (   Y #=< Y1 #/\ Y + R #=< Y1)
    #\/
    (Y1 #=< Y #/\ Y1 + R1 #=< Y)
).



kwadraty(Rozmiar, Szerokosc, Wysokosc, Wspolrzedne):-
    wkladanie_kwadratow(Rozmiar,Szerokosc,Wysokosc,_,Wspolrzedne),
    label(Wspolrzedne).
   % write(Z).
