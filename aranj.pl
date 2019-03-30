ins(E,L,[E|L]).
ins(E,[H|T],[H|R]):- ins(E, T, R).

perm([], []).
perm([H|T], R):- perm(T, R1),
                 ins(H, R1, R).

comb([H|_], 1, [H]).
comb([_|T], K, R):-comb(T, K, R).
comb([H|T], K, [H|R]):- K1 is K-1,
                    comb(T, K1, R).

aranj([], _, []).
aranj(L, K, R):- comb(L,K,R1),
                 perm(R1, R).

prod([], 1).
prod([H|T], P):- prod(T, P1),
                 P is P1 * H.

generate(L, K, P, RL):- aranj(L, K, R),
                    prod(R, PR),
                    PR =:= P,
                    RL = R.

onesol(L, K, P, R):- findall(R1,generate(L, K, P, R1),R).

