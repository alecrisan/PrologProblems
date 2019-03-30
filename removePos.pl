%removePos(L:list, N:int, P:int, R:result list)
%removePos flow model (i,i,i,o)

removePos([],_,_,[]).
removePos([_|T], N, P, R):- P =:= N,
                        P1 is P+1,
                        N1 is N*2,
                        removePos(T, N1, P1, R).
removePos([H|T], N, P, R):- P =\= N,
                        P1 is P+1,
                        removePos(T, N, P1, R1),
                        R = [H|R1].
