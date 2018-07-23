append([], List, List).
append([Head|Tail], List2, [Head|Result]) :- append(Tail, List2, Result).
