
% in_list(+List, ?El)
% checks if El in List or saves List head in El

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


% next_permutation(+Alphabet, +K, -Perm)
% unifies Perm with next K lengthed permutation of Alphabet el-s 

next_permutation(Alphabet, K, Perm):- next_permutation(Alphabet, K, [], Perm).
next_permutation(_, 0, Perm, Perm):- !.
next_permutation(Alphabet, K, CurPerm, Perm):- in_list(Alphabet, El), NewK is K - 1, next_permutation(Alphabet, NewK, [El|CurPerm], Perm).


% print_permutations(+Alphabet, +K)
% prints all K lengthed permutations of Alphabet el-s

print_permutations(Alphabet, K):- print_permutations(Alphabet, K, []).
print_permutations(_, 0, Perm):- write(Perm), nl, !, fail.
print_permutations(Alphabet, K, Perm):- in_list(Alphabet, El), NewK is K - 1, print_permutations(Alphabet, NewK, [El|Perm]). 


% print_combinations(+Alphabet, +K)
% prints all K lengthed combinations of Alphabet el-s

print_combinations(Alphabet, K):- print_combinations(Alphabet, K, []).
print_combinations(_, 0, Comb):- write(Comb), nl, !, fail.
print_combinations([El|Tail], K, Comb):- NewK is K - 1, print_combinations(Tail, NewK, [El|Comb]).
print_combinations([_|Tail], K, Comb):- print_combinations(Tail, K, Comb).

