
% in_list(+List, ?El)
% checks if El in List or saves List head in El

in_list([El|_],El).

in_list([_|T],El):-
    in_list(T,El).


% next_permutation(+Alphabet, +K, -Perm)
% unifies Perm with next K lengthed permutation of Alphabet el-s 

next_permutation(Alphabet, K, Perm):-
    next_permutation(Alphabet, K, [], Perm).

next_permutation(_, 0, Perm, Perm):- !.

next_permutation(Alphabet, K, CurPerm, Perm):-
    in_list(Alphabet, El),
    NewK is K - 1,
    next_permutation(Alphabet, NewK, [El|CurPerm], Perm).


% print_permutations(+Alphabet, +K)
% prints all K lengthed permutations of Alphabet el-s

print_permutations(Alphabet, K):-
    print_permutations(Alphabet, K, []).

print_permutations(_, 0, Perm):-
    write(Perm), nl, !, fail.

print_permutations(Alphabet, K, Perm):-
    in_list(Alphabet, El),
    NewK is K - 1,
    print_permutations(Alphabet, NewK, [El|Perm]). 


% next_combination(+Alphabet, +K, -Comb)
% unifies Comb with next K lengthed combination of Alphabet el-s 

next_combination(Alphabet, K, Comb):-
    next_combination(Alphabet, K, [], Comb).

next_combination(_, 0, Comb, Comb):-!.

next_combination([El|Tail], K, CurComb, Comb):-
    NewK is K - 1,
    next_combination(Tail, NewK, [El|CurComb], Comb).

next_combination([_|Tail], K, CurComb, Comb):-
    next_combination(Tail, K, CurComb, Comb).


% print_combinations(+Alphabet, +K)
% prints all K lengthed combinations of Alphabet el-s

print_combinations(Alphabet, K):-
    print_combinations(Alphabet, K, []).

print_combinations(_, 0, Comb):-
    write(Comb), nl, !, fail.

print_combinations([El|Tail], K, Comb):-
    NewK is K - 1,
    print_combinations(Tail, NewK, [El|Comb]).

print_combinations([_|Tail], K, Comb):-
    print_combinations(Tail, K, Comb).


% range(+Start, +End, -Res)
% saves list with numeric range from Start to End in Res

range(End, Res):-
    range(0, End, [], Res).

range(Start, End, Res):-
    range(Start, End, [], Res).

range(End, End, CurRes, CurRes):- !.

range(Start, End, CurRes, Res):-
    NewStart is Start + 1,
    range(NewStart, End, [Start|CurRes], Res).  


% mix_with_a(+PosComb, +Perm, -Word)

mix_with_a(PosComb, Perm, Word):-
    mix_with_a(PosComb, Perm, Word, [], 0).

mix_with_a([], [], CurWord, CurWord, _).

mix_with_a([H|T], Perm, Word, CurWord, H):-
    NewI is H + 1,
    mix_with_a(T, Perm, Word, [a|CurWord], NewI),
    !.

mix_with_a(PosComb, [H|T], Word, CurWord, I):-
    NewI is I + 1,
    mix_with_a(PosComb, T, Word, [H|CurWord], NewI). 


% print_3a_words(+Alphabet, +K)

print_3a_words(Alphabet, K):-
    range(K, PosList),
    next_combination(PosList, 3, CurPosComb),
    NewK is K - 3,
    next_permutation(Alphabet, NewK, CurPerm),
    mix_with_a(CurPosComb, CurPerm, CurWord),
    write(CurWord), nl, fail.
