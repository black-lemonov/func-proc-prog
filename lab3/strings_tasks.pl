
% read_file(-StrList)
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
    nl,
    write("2.2 Lines without spaces = "),
    count_els_w_no_spaces(FileStrList, CountElsWNoSpaces),
    write(CountElsWNoSpaces),
    nl.


% max_length_ofList(+StrList, -MaxLen)
% finds max length of list el-s

max_length_of_list(StrList, MaxLen):-
    max_length_of_list(StrList, 0, MaxLen).

max_length_of_list([], CurMaxLen, CurMaxLen).

max_length_of_list([Line|RestLines], CurMaxLen, MaxLen):-
    string_length(Line, CurLen),
    max(CurMaxLen, CurLen, NewCurMaxLen),
    max_length_of_list(RestLines, NewCurMaxLen, MaxLen).


% count_els_w_no_spaces(+strList, -Counter)
% counts list el-s with no spaces

count_els_w_no_spaces(StrList, Counter):-
    count_els_w_no_spaces(StrList, 0, Counter).

count_els_w_no_spaces([], CurCounter, CurCounter).

count_els_w_no_spaces([El|RestEls], CurCounter, Counter):- 
    count(El, ' ', CurElCounter),
    CurElCounter == 0,
    NewCurCounter is CurCounter + 1,
    count_els_w_no_spaces(RestEls, NewCurCounter, Counter),
    !.

count_els_w_no_spaces([_|RestEls], CurCounter, Counter):-
    count_els_w_no_spaces(RestEls, CurCounter, Counter).


% count(+String, +El, -Count)
% count El in List

count(String, El, Count) :-
    string_chars(String, CharList),
    count(CharList, El, 0, Count).

count([], _, CurCount, CurCount).

count([Char|RestChars], El, CurCount, Count):-
    Char == El,
    NewCurCount is CurCount + 1,
    count(RestChars, El, NewCurCount, Count),
    !.

count([_|RestChars], El, CurCount, Count):-
    count(RestChars, El, CurCount, Count).


% average_in_list(+StrList, +El, -Avg) 
% finds average number of El in list

average_in_list(StrList, El, Avg):- 
    length(StrList, ListLen),
    atomics_to_string(StrList, ListToStr),
    count(ListToStr, El, CountA),
    Avg is CountA // ListLen.


% more_than_avg(+StrList, +El, -ResList)
% saves lines in which the element
% appears more times than average

more_than_avg(StrList, El, ResList):-
    average_in_list(StrList, El, Avg),
    more_than_avg(StrList, El, Avg, [], ResList).

more_than_avg([], _, _, CurResList, CurResList).

more_than_avg([CurEl | RestEls], El, Avg, CurResList, ResList):-
    count(CurEl, El, CurCount),
    CurCount > Avg,
    more_than_avg(RestEls, El, Avg, [CurEl|CurResList], ResList),
    !.

more_than_avg([_ | RestEls], El, Avg, CurResList, ResList):-
    more_than_avg(RestEls, El, Avg, CurResList, ResList).


% write_list(+List)
% writes list

write_list([]).

write_list([El|RestEls]):-
    write(El),
    nl,
    write_list(RestEls).