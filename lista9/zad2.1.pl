:- use_module(library(clpfd)).
% rozmiary, szerokosc, wysokosc, tablica juz wstawionych, tablica
% wspolrzednych
%tablica juz wstawionych ma strukture elementow
% [X,Y,Rozmiar]
wkladanie_kwadratow([],_,_,[],[]):-
    !.
wkladanie_kwadratow([Roz|Reszta],Szerokosc,Wysokosc,[f(S1,Roz,W1,Roz)|Wst],[S1,W1|Wsp]):-
    S #= Szerokosc - Roz,
    W #= Wysokosc - Roz,
    S1 in 0..S,
    W1 in 0..W,
    wkladanie_kwadratow(Reszta,Szerokosc,Wysokosc,Wst,Wsp).


kwadraty(Rozmiar, Szerokosc, Wysokosc, Wspolrzedne):-
    wkladanie_kwadratow(Rozmiar,Szerokosc,Wysokosc,Z,Wspolrzedne),
    disjoint2(Z),
    label(Wspolrzedne).
  %  write(Z).
