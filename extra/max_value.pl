
% max(+X,+Y,+X)
% max value from 2 numbers
max(X, Y, X):- X>Y, !.
max(_, Y, Y).

% max3(+X,+Y,+U, +X)
% max value from 3 numbers
max3(X, Y, U, X):- X>Y, X>U, !.
max3(_, Y, U, Y):- Y>U, !.
max3(_, _, U, U).

% fact up
fact(0, 1):- !.
fact(N, X):-N1 is N-1, fact(N1, X1), X is N*X1.

% fact down (calculations before recursion call)
fact1(N,X):- fact2(0,1,N,X).
fact2(N,Y,N,Y):-!.
fact2(N,_,N,_):-!, fail.
fact2(I,Y,N,X):-I1 is I+1, Y1 is Y*I1, fact2(I1, Y1, N, X).

max_sum_digits([A], A):- !.
max_sum_digits([CurEl|Tail], Res1):- sum_digits_up(CurEl, SCCurEl), max_sum_digits(Tail, Res1), sum_digits_up(Res1, ScRes1), SCCurEl < ScRes1, !.
max_sum_digits([CurEl|Tail], CurEl).

maxList([A], CurI, CurI):-!.
maxList([CurEl|Tail], CurSum, CurI):- sum_digits_up(CurEl, CurSum), NewI is CurI + 1, maxList(Tail, NewSum, NewI),  (NewSum > CurSum -> CurI is NewI). 


% digits sum recur up
sum_digits_up(0, 0):-!.
sum_digits_up(X, Sum):- X1 is X // 10, Left is X mod 10, sum_digits_up(X1, Sum1), Sum is Sum1 + Left.

% digits sum recur down
sum_digits_down(N,X):- sum_digits(N,0,X).
sum_digits(0,X,X):-!.
sum_digits(N,CurX,X):-
 N1 is N // 10, Left is N mod 10, NewX is CurX + Left, sum_digits(N1, NewX, X).
