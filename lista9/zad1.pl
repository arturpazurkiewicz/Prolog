:- use_module(library(clpfd)).

%         R1 R2
resources(5, 5).

tasks([
    %D  R1 R2
    [2, 1, 3],
    [3, 2, 1],
    [4, 2, 2],
    [3, 3, 2],
    [3, 1, 1],
    [3, 4, 2],
    [5, 2, 1]
]).

create_tasks([],[],[],[],0):- !.
create_tasks([[D,X,Y]|Rest],[task(S,D,E,X,_)|X1],[task(S,D,E,Y,_)|Y1],[S|S1],MakeSpan):-
    create_tasks(Rest,X1,Y1,S1,E2),
    MakeSpan #= max(E,E2).


% Horizon - licznik czasu, Starts - lista rozpoczecia zadan, MakeSpan -
% termin zakonczenia ostatniego zadania
schedule(Horizon, Starts, MakeSpan):-
    tasks(Tasks),
    create_tasks(Tasks,TX,TY,Starts,MakeSpan),
    Starts ins 0..Horizon,
    resources(Limit1,Limit2),
    cumulative(TX, [limit(Limit1)]),
    cumulative(TY, [limit(Limit2)]),
    once(labeling([min(MakeSpan)],Starts)).
