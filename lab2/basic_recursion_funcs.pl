
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

% read_list(+N, -X)
% N is list length
% X is variable
% reads input numbers
% and saves them in X
read_list(0, []).
read_list(N, [El|Tail]):- read(El), NewN is N - 1, read_list(NewN, Tail).


% write_list(+X)
% writes list el-s separated by 1 space
write_list([]).
write_list([El|Tail]):- write(El), tab(1), write_list(Tail).


% sum_list_down(+List, ?Sum)
% finds or checks list sum with recursion down
sum_list_down(List, Sum):- sum_list_down_(List, 0, Sum).
sum_list_down_([], CurSum, CurSum).
sum_list_down_([El|Tail], CurSum, Sum):-
	NewSum is CurSum + El, sum_list_down_(Tail, NewSum, Sum).  


% read_n_find_sum
% reads list and finds its sum
read_n_find_sum:-
	write("length = "), read(Len), read_list(Len, X),
	sum_list_down(X, Sum), write("sum is "), write(Sum). 


% sum_list_up(+List, ?Sum)
% finds or checks list sum with recursion up
sum_list_up([], 0).
sum_list_up([El|Tail], Sum):- sum_list_up(Tail, CurSum), Sum is CurSum+El.


% rm_w_sum_digits(+In, +Sum, ?Out)
% removes el-s with sum digits = Sum
% or checks if Out is In without such el-s 
rm_w_sum_digits([], _, []):- !.
rm_w_sum_digits([El|Tail], Sum, List):-
	sum_digits_up(El, CurSum), CurSum == Sum,
	rm_w_sum_digits(Tail, Sum, NewList), List = NewList.
rm_w_sum_digits([El|Tail], Sum, List):-
	sum_digits_up(El, CurSum), CurSum \== Sum,
	rm_w_sum_digits(Tail, Sum, NewList), List = [El|NewList].


% prod_digits_up(+N, ?Prod)
% finds N digits product
% or checks if it is equal to Prod 
prod_digits_up(0, 1):- !.
prod_digits_up(N, Prod):-
	NewN is N // 10, I is N mod 10, prod_digits_up(NewN, NewProd),
	Prod is NewProd * I.  


% prod_digits_down(+N, -Prod)
% finds N digits product
prod_digits_down(N, Prod):- prod_digits_down_(N, 1, Prod).
prod_digits_down_(0, CurProd, CurProd).
prod_digits_down_(N, CurProd, Prod):-
	NewN is N // 10, I is N mod 10, NewProd is CurProd * I,
	prod_digits_down_(NewN, NewProd, Prod). 

