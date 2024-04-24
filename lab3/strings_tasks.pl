
% read_file(+StrList)
% converts input to list of lines sep-d with '\n'

read_file(StrList):-
    read_file('', StrList).

read_file(CurStr, StrList):- 
    get_char(Char),
    Char \= 'end_of_file',
    string_concat(CurStr, Char, NewStr),
    read_file(NewStr, StrList),
    !.

read_file(CurStr, StrList):-
    split_string(CurStr, "\n", "\n", StrList).


% open_fail(+FilePath)
% switch input to file witth specified path

open_file(FilePath) :-
    see(FilePath),
    read_file(FileStrList),
    write("2.1 Max length = "),
    max_length_of_list(FileStrList, MaxLen),
    write(MaxLen),
    nl.