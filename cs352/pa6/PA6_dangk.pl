% W: weight; H: height; B: BMI
bmi(_, 0, 0) :- !.
bmi(W, H, B) :- W>=0, H>0, B is (W / (H * H) * 703).

/* Part 1 (a) output:
* ?- bmi(0,0,B).
* B = 0.
* ?- bmi(100,60,B).
* B = 19.527777777777775.
* ?- bmi(150,72,B).
* B = 20.341435185185187.
* ?- bmi(215,68,X).
* X = 32.68706747404844.
*/

% A; B; X: diff/sum; Y: prod/quot
pair(A, B, X, Y) :- A >= B, X is A - B, Y is A * B.
pair(A, B, X, Y) :- A < B, X is A + B, Y is A / B.

/* Part 1(b) output:
* ?- pair(5,3,X,Y).
* X = 2,
* Y = 15 .
* ?- pair(3,5,X,Y).
* X = 8,
* Y = 0.6.
*/

has(jack,apples).
has(jack,money).
has(ann,plums).
has(dan,money).
fruit(apples).
fruit(plums).

/* Part 2(a) output:
* ?- has(jack,X).
* X = apples .
* ?- has(X,apples), has(Y,plums).
* X = jack,
* Y = ann.
* ?- has(dan, X), fruit(X).
* false.
* ?- has(X, Y), not(fruit(Y)).
* X = jack,
* Y = money .
*/

has(jack,apples).
has(jack,money).
has(ann,plums).
has(dan,money).
fruit(apples).
fruit(plums).

/* Part 2(a) output:
* ?- has(jack,X).
* X = apples .
* ?- has(X,apples), has(Y,plums).
* X = jack,
* Y = ann.
* ?- has(dan,X), fruit(X).
* false.
* ?- has(X,Y), not(fruit(Y)).
* X = jack,
* Y = money .
*/

happy(bill).
happy(mary).
happy(john).
happy(alex).
sad(bill).
likes(john,corvettes).
likes(john,wine).
likes(john,book).
likes(mary,book).
likes(mary,corvettes).
likes(alex,corvettes).
smart(X) :- likes(X,book).
valuable(X) :- likes(mary,X).

/* Part 2(b) output:
* ?- happy(X).
* X = bill .
* ?- likes(X,book).
* X = john .
* ?- smart(X).
* X = john .
* ?- valuable(X).
* X = book .
* ?- happy(X), sad(X).
* X = bill .
* ?- happy(X), likes(X, book).
* X = mary .
*/
