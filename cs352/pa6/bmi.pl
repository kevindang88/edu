% W: weight; H: height; B: BMI
bmi(_, 0, 0) :- !.
bmi(W, H, B) :- W>=0, H>0, B is (W / (H * H) * 703).
