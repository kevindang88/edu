% facts
reigns(victoria,1837,1901).
reigns(edward7,1901,1910).
reigns(george5,1910,1936).
reigns(edward8,1936,1936).
reigns(george6,1936,1952).
reigns(elizabeth2,1952,2008).

% who ruled longest - this returns year only
longest(N) :- years_rules(_,N), not((years_ruled(_,M),M>N)).

% this will return who and how many years
longestWho(Person, N) :- years_ruled(Person,N), not((years_ruled(_,M),M>N)).
