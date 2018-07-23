%comment
sode([],[]).
sode([X|Y], Z) :- X mod 2 =:= 0, sode(Y,Z).
sode([X|Y], [Z1|Z]) :- X mod 2 =\= 0, Z1 is X * X, sode(Y,Z).

split([],[],[]).
split([X],[X],[]).
split([X,Y|Z], [X|Xs], [Y|Ys]) :- split(Z,Xs,Ys).
