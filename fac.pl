fac(0, 1).
fac(A, B) :-
  A > 0,
  Ax is A - 1,
  fac(Ax, Bx),
  B is A * Bx.
