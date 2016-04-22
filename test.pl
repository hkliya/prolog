:- use_module(library(clpfd)).

check(Puzzle, Solution) :-
  Solution = Puzzle,
  Puzzle = [A, B, C],
  Puzzle ins 1..5,
  A = B + 1,
  B = C + 1.
