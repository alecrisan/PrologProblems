 % Write a predicate to add a value v after 1-st, 2-nd, 4-th, 8-th, …
% element in a list.
% insert(V:int, P:int, N:int, L:list, RL: list).
% V - value to be inserted
% P - position to be inserted on
% N - initial position
% L - initial list
% RL - result list
% insert flow model (i,i,i,i,o).

insert(_,_,_,[],[]).
insert(V, P, N, [H|T], RL):- P =\= N,
    N1 is N+1,
    insert(V, P, N1, T, TL),
    RL = [H|TL].
insert(V, P, N, [H|T],RL):- P =:= N,
    N1 is N+1,
    P1 is P*2,
    insert(V,P1,N1,T,TL),
    RL = [H, V|TL].

insert_final(V, [H|T], RL):- insert(V, 1, 1, [H|T], RL).
