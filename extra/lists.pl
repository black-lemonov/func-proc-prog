count_loc_max(List, Count):- count_loc_max(List, 0,Count).
count_loc_max([_,_], Count, Count):-!.
count_loc_max([A,B,C|Tail], CurCount, Count):-
 B > A, B > C, NewCount is CurCount + 1, count_loc_max([B,C|Tail], NewCount, Count), !.
count_loc_max([_,B,C|Tail], CurCount, Count):- count_loc_max([B,C|Tail], CurCount, Count).

% rec up
sum_el([], 0):-!.
sum_el([H|T], Sum):- sum_el(T, SumT), Sum is H + SumT.


% rec down
sum_el_down(List, Sum):- sum_el_down(List, 0, Sum).
sum_el_down([], Sum, Sum):-!.

% Мелиш Пролог  