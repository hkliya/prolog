check(Puzzle, Solution) :-
  Puzzle = Solution,
  Puzzle = [[A, B, E], [C, B, E], [A, C, D]],
  B is A - 10,
  E is B - 10,
  B is C - 10,
  C is A - 10,
  D is C - 10.


