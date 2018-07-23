%comment
/*greet(Anybody) :- write('Hello '), write(Anybody).*/
greet(andy) :- write('How are you?').
greet(emily) :- write('Nice to see  you!').
greet(X) :- write('Hi '), write(X).
