arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).

osiagalny(X,X).
osiagalny(X,Y) :- os(X,Y, [X]).

os(X, Y, L) :-
    arc(X, Z),
    \+ (member(Z, L)),
    (
           Y = Z
    ;      os(Z, Y, [Z | L])
    ).
