:- consult(zad1).
% załozylem ze w split chodzi o to by split wkladal elementy
% naprzemiennie, oraz tak jak w przykładzie tylko 1 odpowiedz
split(IN,OUT1,OUT2):-
    freeze(IN,
    (   IN = [H|R]
    ->  (   OUT1 = [H|R1],
            split(R,OUT2,R1)
        )

    ;   (
            OUT1 = [],
            OUT2 = []
        )
    )).


merge_sort(IN,OUT):-
    freeze(IN,
    (   IN = [_|R]
        ->  freeze(R,
            (   R = [_|_]
            ->  (   split(IN,X1,X2),
                    merge_sort(X1,Y1),
                    merge_sort(X2,Y2),
                    merge(Y1,Y2,OUT)
                )
            ;   IN = OUT
            ))
        ;   OUT = []
    )).
