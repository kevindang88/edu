% A; B; X: diff/sum; Y: prod/quot
pair(A, B, X, Y) :- A >= B, X is A - B, Y is A * B.
pair(A, B, X, Y) :- A < B, X is A + B, Y is A / B.
