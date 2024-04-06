
% max(+X, +Y, +Z, ?U)
% finds max number among numbers X, Y, Z
% and saves it in U
max(X, Y, Z, X):- X >= Y, Y >= Z, !.
max(_, Y, Z, Y):- Y >= Z, !.
max(_, _, Z, Z).

% fact_up(+N, ?X)
% recursion up
% saves N factorial in X
fact_up(0, 1):- !.
fact_up(N, X):- N1 is N-1, fact_up(N1, X1), X is X1 * N.

% fact_down(+N, ?X)
% recursion down
% saves N factorial in X
fact_down(N, X):- fact_down_(0, 1, N, X).
fact_down_(N, Y, N, Y):- !.
fact_down_(N, _, N, _):- !, fail.
fact_down_(I, Y, N, X):-
	I1 is I + 1, Y1 is Y * I1, fact_down_(I1, Y1, N, X).

% sum_digits_up(+N, ?X)
% recursion up
% saves digits sum in X 
sum_digits_up(0, 0):- !.
sum_digits_up(X, Sum):-
	X1 is X // 10, Left is X mod 10, sum_digits_up(X1, Sum1),
	Sum is Sum1 + Left.

% sum_digits_down(+N, -X)
% recursion down
% saves digits sum in X
sum_digits_down(N, X):- sum_digits_down_(N, 0, X).
sum_digits_down_(0, CurSum, CurSum).
sum_digits_down_(N, CurSum, X):-
	N1 is N // 10, Add is N mod 10, NewSum is CurSum + Add,
	sum_digits_down_(N1, NewSum, X).


% square_free(+N)
% checks if number isn't divided
% by any square except itsel 
square_free(N):- square_free_(N, 2).
square_free_(N, CurX):- Sqr is CurX * CurX, N < Sqr, !.
square_free_(N, CurX):- Sqr is CurX * CurX, N mod Sqr =:= 0, !, fail.
square_free_(N, CurX):-
	Sqr is CurX * CurX, NewX is CurX + 1, square_free_(N, NewX).
