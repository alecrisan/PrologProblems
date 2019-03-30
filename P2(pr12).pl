%Define a predicate to add after every element from a list, the divisors of that
%number.
%div(N:integer, P:integer, L:list)
%div_final(N:integer, L:list)
%div flow model(i,i,o)
%div_final flow model(i,o)

div(N, P, [P|T]):- N/2 >= P,
               N mod P =:= 0,
               P1 is P+1,
               div(N, P1, T).
div(N, P, L):- N/2 >= P,
               N mod P =\=0,
               P1 is P+1,
               div(N, P1, L).
div(N, P, []):- N/2 < P.

div_final(N, L):- div(N, 2, L).

%concatenate(L:list, L2:list, R:resultlist)
%concatenate flow model(i, i, o).

concatenate([],L1,L1).
concatenate([X|T],L2,[X|T1]):- concatenate(T,L2,T1).


%len(L:list, R:result)
%len flow model(i, o).

len([],0).
len([_|T],R):- len(T, RT),
               R is 1+RT.

% add(L1:list that remains the same, L2:list that we go through,
% X:integer(counter), RL:result list)
% add flow model(i,i,i,o)
% add_final(L:list, RL:result list)
% add_final flow model(i, o)


%add(_,[],_,[]).
add(L1,[H|T],X, RL):-
                 len(L1, F),
                 X =< F,
                 div_final(H, L),
                 L2=[H|L],
                 X1 is X+1,
                 add(L1,T, X1, RT),
                 concatenate(L2, RT, R),
                 RL = R.
add(L1, _, X, []):- len(L1, F),
                         X > F.

add_final(L, RL):- add(L, L, 1, RL).


% For a heterogeneous list, formed from integer numbers and list of
% numbers, define a predicate to add in every sublist the divisors of
% every element
% add_in_sublist(L:list, RL:result list)
% add_in_sublist flow model(i, o).

add_in_sublist([], []).

add_in_sublist([H|T], RL):- is_list(H),
                  add_final(H, R),
                  add_in_sublist(T, RT),
                  RL = [R|RT].

add_in_sublist([H|T], RL):- number(H),
                  add_in_sublist(T, RT),
                  RL = [H|RT].
