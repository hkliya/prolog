sigma(A, A, A).
sigma(A, B, N) :-
  B > A,
  A1 is A + 1,
  sigma(A1, B, N1),
  N is A + N1.


