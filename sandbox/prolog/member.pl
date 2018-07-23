member(X, [X|Y]).
member(X, [H|Y]) :- member(X, Y).
