
% max(+X, +Y, -Max)
% finds max value from 2 values

max(X, Y, Max):-
    X > Y,
    Max is X.

max(_, Y, Y).

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
    nl,
    write("2.3 Lines with more 'a' than average: "),
    nl,
    more_than_avg(FileStrList, 'a', ResList),
    write_list(ResList),
    write("2.4 Most frequent word is "),
    find_most_freq_el(FileStrList, MostFreqEl),
    write(MostFreqEl),
    nl,
    seen,
    write("2.5 Write file path: "),
    read(NewFilePath),
    tell(NewFilePath),
    list_to_words(FileStrList, FileWordsList),
    unique(FileWordsList, UniWordsList),
    write_list(UniWordsList),
    told,
    nl,
    write("Written successfully!").


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


% list_to_words(+StrList, -WordsList)
% splits lines into el-s and saves them in one list

list_to_words(StrList, WordsList):-
    list_to_words(StrList, [], WordsList).

list_to_words([], CurWordsList, CurWordsList).

list_to_words([CurLine|RestLines], CurWordsList, WordsList):-
    split_string(CurLine, " ", " ", CurLineWordsList),
    append(CurWordsList, CurLineWordsList, NewCurWordsList),
    list_to_words(RestLines, NewCurWordsList, WordsList).


% count_most_freq_el(+StrList, -MaxCount)
% finds most frequent occurrence of the el-s
% in the list

count_most_freq_el(StrList, MaxCount):-
    list_to_words(StrList, WordsList),
    count_most_freq_el(WordsList, WordsList, 0, MaxCount).

count_most_freq_el([], _, CurMaxCount, CurMaxCount).

count_most_freq_el([El|RestEls], List, CurMaxCount, MaxCount):-
    count(List, El, 0, CurElCount),
    CurMaxCount < CurElCount,
    count_most_freq_el(RestEls, List, CurElCount, MaxCount),
    !.

count_most_freq_el([_|RestEls], List, CurMaxCount, MaxCount):-
    count_most_freq_el(RestEls, List, CurMaxCount, MaxCount).


% find_most_freq_el(+StrList, -MostFreqEl)
% finds which el occurs most frequently 
% in the list

find_most_freq_el(StrList, MostFreqEl):-
    count_most_freq_el(StrList, MaxFreq),
    list_to_words(StrList, WordsList),
    find_most_freq_el(WordsList, WordsList, MaxFreq, MostFreqEl).

find_most_freq_el([El|_], WordsList, MaxFreq, MostFreqEl):-
    count(WordsList, El, 0, CurElFreq),
    CurElFreq == MaxFreq,
    MostFreqEl = El,
    !.

find_most_freq_el([_|RestEls], WordsList, MaxFreq, MostFreqEl):-
    find_most_freq_el(RestEls, WordsList, MaxFreq, MostFreqEl).


% unique(+List, -NewList)
% makes list of unique values 

unique(List, NewList):-
    unique(List, List, [], NewList).

unique([], _, CurList, CurList).

unique([El|RestEls], List, CurList, NewList):-
    count(List, El, 0, ElCount),
    ElCount == 1,
    unique(RestEls, List, [El|CurList], NewList),
    !.

unique([_|RestEls], List, CurList, NewList):-
    unique(RestEls, List, CurList, NewList).