subsets([],[]).
subsets([H|T],[H|R]):- subsets(T, R).
subsets([_|T], R):- subsets(T, R).


len([], 0).
len([_|T], L):- len(T, R),
                L is 1+R.

generate(L, R):- subsets(L, R1),
                 len(R1, F),
                 F mod 2 =:= 0,
                 R = R1.
