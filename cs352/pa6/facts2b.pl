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
