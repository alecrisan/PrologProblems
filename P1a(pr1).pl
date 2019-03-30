% Write a predicate to determine the lowest common multiple of a list formed from
% integer numbers
% gcd(X:int, Y:int, G:int)
% gcd flow model(i, i, o)
% X, Y - the given numbers
% G - the greatest common divisor of X and Y
gcd(0, Y, Y).
gcd(X, 0, X).
gcd(X, Y, X):- X =:= Y.
gcd(X, Y, G):- X < Y,
               X =\= 0,
               Y =\= 0,
               Y1 is Y-X,
               gcd(X, Y1, G).
gcd(X, Y, G):- X > Y,
               X =\= 0,
               Y =\= 0,
               gcd(Y, X, G).

% lcm(X:int, Y:int, R:int)
% lcm flow model(i, i, o)
% X, Y - the given numbers
% R - the lowest common multiple of X and Y

lcm(X,Y,R):- gcd(X,Y,G),
             R is X*Y/G.

% lcm_list(L:list, R:int)
% lcm_list flow model (i, o).
% L - the integer numbers list
% R - the lowest common multiple of all the numbers in the list

lcm_list([], 1).
lcm_list([H|T], L):- lcm_list(T,R1),
                    lcm(H,R1,L).
