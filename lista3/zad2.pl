max_sum(L,X) :-
    max_sum_finder(L,0,0,X).
% lista, M - ostatni max ciag,A - aktualny ciag, R - result
max_sum_finder([],M,_,M).
max_sum_finder([H|R],M,A,X) :-
    A1 is H + A,
    ( A1 > 0 ->(A2 is A1,
               (A2 > M -> M1 is A2
                          ; M1 is M))
               ; (A2 is 0,
                  M1 is M )),
    max_sum_finder(R,M1,A2,X).
