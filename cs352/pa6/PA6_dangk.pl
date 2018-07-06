% W: weight; H: height; B: BMI
bmi(_, 0, 0) :- !.
bmi(W, H, B) :- W>=0, H>0, B is (W / (H * H) * 703).

/* Part 1 (a) output:
* ?- [bmi].
true.

?- bmi(0,0,B).
B = 0.

?- bmi(100,60,B).
B = 19.527777777777775.

?- bmi(150,72,B).
B = 20.341435185185187.

?- bmi(215,68,X).
X = 32.68706747404844.
*/
