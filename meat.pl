love(fat, meat).
love(thin, vegatable).
is_a(leath, fat).
is_a(sheng, thin).

eat(X, Y) :- is_a(X, Z), love(Z, Y).


