%reverse(L:list, R:result list)
%reverse flow model (i,o)

adaug_sf(E, [], [E]).
adaug_sf(E, [H|T], [H|T1]) :- adaug_sf(E, T, T1).


reverse([], []).
reverse([H|T], [R1|R2]):- is_list(H),
                    reverse(H, R1),
                    reverse(T, R2).
                    %R = [R1|R2].
reverse([H|T], R):- number(H),
                    reverse(T, R1),
                    adaug_sf(H, R1, R).

