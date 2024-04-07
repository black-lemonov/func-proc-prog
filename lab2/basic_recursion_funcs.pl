
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
	NewX is CurX + 1, square_free_(N, NewX).

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


% max_digit_not_mod3_up(+N, -Max)
% finds max digit not divisible by 3
max_digit_not_mod3_up(0, 0).
max_digit_not_mod3_up(N, Max):- 
	NewN is N // 10, I is N mod 10, I mod 3 =:= 0, NewI = 0, max_digit_not_mod3_up(NewN, NewMax),
	max(NewMax, NewI, 0, Max).
max_digit_not_mod3_up(N, Max):- 
	NewN is N // 10, I is N mod 10, max_digit_not_mod3_up(NewN, NewMax),
	max(NewMax, I, 0, Max).


% max_digit_not_mod3_down(+N, -Max)
% finds max digit not divisible by 3
max_digit_not_mod3_down(N, Max):- max_digit_not_mod3_down_(N, 0, Max).
max_digit_not_mod3_down_(0, CurMax, CurMax).
max_digit_not_mod3_down_(N, CurMax, Max):- 
	NewN is N // 10, I is N mod 10, I mod 3 =:= 0, NewI = 0, max(CurMax, NewI, 0, NewMax),
	max_digit_not_mod3_down_(NewN, NewMax, Max).
max_digit_not_mod3_down_(N, CurMax, Max):- 
	NewN is N // 10, I is N mod 10, max(CurMax, I, 0, NewMax),
	max_digit_not_mod3_down_(NewN, NewMax, Max).


% count_divs_up(+N, -Count)
% counts N dividers (including 1 and itself)
count_divs_up(N, Count):- count_divs_up_(N, 1, Count).
count_divs_up_(N, N, 1).
count_divs_up_(N, Div, Count):- 
	NewDiv is Div + 1, N mod Div =:= 0, count_divs_up_(N, NewDiv, NewCount), Count is NewCount + 1.
count_divs_up_(N, Div, Count):- 
	NewDiv is Div + 1, count_divs_up_(N, NewDiv, NewCount), Count is NewCount.


% count_divs_down(+N, -Count)
% counts N dividers (including 1 and itself)
count_divs_down(N, Count):- count_divs_down_(N, 1, 1, Count).
count_divs_down_(N, N, CurCount, CurCount).
count_divs_down_(N, Div, CurCount, Count):-
	N mod Div =:= 0, NewCount is CurCount + 1, NewDiv is Div + 1,
	count_divs_down_(N, NewDiv, NewCount, Count).
count_divs_down_(N, Div, CurCount, Count):-
	NewDiv is Div + 1, count_divs_down_(N, NewDiv, CurCount, Count).

% count_matches/0
% reads two lists, runs count_matches, saves its result in Answer, writes Answer
count_matches:-
	write("Task 10: Provided two lists. Find the number of matching values elements."), nl,
	write("Enter list ¹1 length with a '.' at the end"), nl, read(Len1),
	write("Enter list ¹1 el-s separated by '.'"), nl, read_list(Len1, List1),
	write("Enter list ¹2 length with a '.' at the end"), nl, read(Len2),
	write("Enter list ¹2 el-s separated by '.'"), nl, read_list(Len2, List2),
	count_matches(List1, List2, Answer),
	write("Answer:"), nl, write(Answer).



% count_matches(+List1, +List2, ?Count)
% count matching el-s in List1 and List2
% or checks if Count equals to number of matching el-s in lists
count_matches([], _, 0).
count_matches([H1|T1], List2, Count):-
	in_list(H1, List2), rm_el(H1, List2, NewList2),
	count_matches(T1, NewList2, NewCount), Count is NewCount + 1, !.
count_matches([_|T1], List2, Count):-
	count_matches(T1, List2, NewCount), Count is NewCount.
 

% in_list(+El, +List)
% checks if El is in List
in_list(_, []):- fail.
in_list(El, [El|_]):- !, true.
in_list(El, [_|T]):- in_list(El, T).


% rm_el(+El, +List, ?NewList)
% removes El from List and saves new list in NewList
% or removes El from List and checks if List equals to NewList
rm_el(_, [], []).
rm_el(El, [El|T], T).
rm_el(El, [H|T], List):-
	rm_el(El, T, NewList), List = [H|NewList], !.


% is_local_min/0
% reads list and index, checks if el. at index is a local min. of list,
% returns true or false.
is_local_min:-
	write("Task 15: Provided list and natural index. Determine whether the element at the specified index is local minimum."), nl,
	write("Enter list length with a '.' at the end"), nl, read(Len),
	write("Enter list el-s separated by '.'"), nl, read_list(Len, List),
	write("Enter natural index (< list length) with '.' at the end"), nl, read(Index),
	write("Answer:"), is_local_min(List, Index).


% is_local_min(+List, +Index)
% checks if List el. with index = Index is local min
is_local_min(_, 1):- !, fail.
is_local_min([L, X, R | _], 2):- !, L > X, R > X.  
is_local_min([_|T], Index):-
	NewIndex is Index - 1, is_local_min(T, NewIndex).


% find_closest/0
% reads real number and list, finds the closest to R list el., saves it in Answer, writes Answer  
find_closest:-
	write("Task 35: Provided real number R and list. Find the closest to R list element."), nl,
	write("Enter number R with '.' at the end"), nl, read(R),
	write("Enter list length with a '.' at the end"), nl, read(Len),
	write("Enter list el-s separated by '.'"), nl, read_list(Len, List),
	find_closest(List, R, Answer),
	write("Answer:"), nl, write(Answer).


% find_closest(+List, +R, ?X)
% finds List closest to R el. and saves it in X
% or checks if X is the closest to R el.  
find_closest([H], _, H).
find_closest([H|T], R, X):-
	find_closest(T, R, NewX), abs(R-NewX) < abs(R-H), X is NewX, !.
find_closest([H|_], _, H).

