%For a list a1... an with integer and distinct numbers, define a
% predicate to determine all subsets with sum of elements divisible with
% n.

%suma(L:list, S: integer sum)
%suma flow model(i,o).

suma([],0).
suma([H|T],S):- suma(T,S2),
                S is S2 + H.

%subsets(L:list, R:result list of subsets)
%subsets flow model(i,o).

subsets([],[]).
subsets([_|T],R):- subsets(T,R).
subsets([H|T],[H|R]):- subsets(T,R).

%len(L:list, R:integer)
%len flow model(i,o).

len([],0).
len([_|T],R):- len(T, RT),
               R is 1+RT.

%all_subsets(L:list, R:result list)
%all_subsets flow model(i,o).

all_subsets(L,R):- findall(X,subsets(L,X),R).

%solve(L:list, R:result list, M:integer)
%solve flow model(i,o,i).

solve([],[],_).
solve([H|T],[H|R],M):- is_list(H),
                       suma(H,P),
                       P mod M =:=0,
                       solve(T,R,M),
                       !.

solve([_|T],R,M):- solve(T,R,M),
                   !.
%main(L:list, R:result list)
%main flow model(i,o).

main(L,R):- all_subsets(L,X),
            len(L, M),
            solve(X,R,M).
