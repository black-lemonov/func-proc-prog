man(anatoliy).
man(dimitriy).
man(vlad).
man(kirill).
man(mefodiy).
woman(vladina).
woman(galya).
woman(sveta).
woman(zoya).
woman(katrin).
dite(dimitriy, anatoliy).
dite(dimitriy, galya).
dite(vladina, anatoliy).
dite(vladina, galya).
dite(kirill, dimitriy).
dite(mefodiy, dimitriy).
dite(kirill, sveta).
dite(mefodiy, sveta).
dite(zoya, vlad).
dite(zoya, vladina).
dite(katrin, vlad).
dite(katrin, vladina).

sin(X,Y):-dite(X,Y),man(X).
doch(X,Y):-dite(X,Y),woman(X).

brak(X,Y):-dite(Z,X),!,dite(Z,Y),not(X=Y).
/* bro(X,Y) Y �������� ������ �
 *  sister(X, Y) Y �������� ������� �
 *  br_s
 *  tetya
 *  dadya
 *  vnuki(X,Y)
*/

max(X,Y,X):-X>Y,!.
max(_,Y,Y).

max3(X,Y,U,X):-X>Y,X>U,!.
max3(_,Y,U,Y):-Y>U,!.
max3(_,_,U,U).

fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is N*X1.

fact1(N,X):-fact2(0,1,N,X).
fact2(N,Y,N,Y):-!.
fact2(I,Y,N,X):-I1 is I+1, Y1 is Y*I1, fact2(I1,Y1,N,X).


fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1, N2 is N-2, fib(N1,X1), fib(N2,X2), X is X1+X2.

fib1(N,X):-fib2(1,1,2,N,X).
fib2(_,B,N,N,B):-!.
fib2(A,B,I,N,X):- I1 is I+1, C is A+B, fib2(B,C,I1,N,X).

pr(2):-!.
pr(X):-pr1(X,2).
pr1(X,X):-!.
pr1(X,I):- Y is X mod I, Y\=0, I1 is I+1, pr1(X,I1).

n_pr(N,X):-npr(N,N,X).
npr(N,I,I):- Y is N mod I, Y=0, pr(I),!.
npr(N,I,X):- I1 is I-1, npr(N,I1,X).


pr3_00:-read(N),write(N).

pr3_0:-read(N),r_list(A,N),w_list(A).
r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,K,B):-read(X),append(B,[X],B1),K1 is K+1,r_list(A,N,K1,B1).
w_list([]):-!.
w_list([H|T]):-write(H),nl,w_list(T).

pr3_1:-read(N),r_list(A,N),list_sum(A,S),write(S).
list_sum(A,S):-list_sum(A,S,0).
list_sum([],S,S):-!.
list_sum([H|T],S,Sum):-Sum1 is Sum+H,list_sum(T,S,Sum1).

pr3_2:-read(N),r_list(A,N),read(I),el_no(A,I,X),write(X).
el_no(A,I,X):-el_no(A,I,1,X).
el_no([H|_],I,I,H):-!.
el_no([_|T],I,K,X):-K1 is K+1,el_no(T,I,K1,X).

pr3_3:-read(N), r_list(A,N), list_min(A,M), write(M).
list_min([H|T],M):-list_min(T,M,H).
list_min([],M,M):-!.
list_min([H|T],M,Min):-H<Min,!,list_min(T,M,H).
list_min([_|T],M,Min):-list_min(T,M,Min).

pr_c(0,0):-!.
pr_c(A,N):- pr_c(A,N,1).
pr_c(0,N,N):-!.
pr_c(A,N,Pr):-Ost is A mod 10,Pr1 is Pr*Ost, A1 is A div 10, pr_c(A1,N,Pr1).

pr_c2(0,0):-!.
pr_c2(A,N):-pr_c1(A,N).
pr_c1(0,1):-!.
pr_c1(A,N):-P is A mod 10, V is A div 10,pr_c1(V,U),N is U*P.

pr_sd(A,N):-pr_sd(A,1,N,0).
pr_sd(A,A,N,N):-!.
pr_sd(A,I,N,Sum):- Ost is A mod I, Ost=0, !, S is Sum+I, I1 is I+1, 
					pr_sd(A,I1,N,S).
pr_sd(A,I,N,Sum):-I1 is I+1, pr_sd(A,I1,N,Sum).

euler(A,N):-euler(1,A,0,N).
euler(A,A,N,N):-!.
euler(I,A,Count,N):-nod(I,A,1),!, K is Count+1, I1 is I+1,euler(I1,A,K,N).
euler(I,A,Count,N):-I1 is I+1,euler(I1,A,Count,N).

nod(A,0,A):-!.
nod(_,0,_):-!,fail.
nod(A,B,C):-Ost is A mod B, nod(B,Ost,C).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

pr5_1:-	read_str(A,N),write_str(A),write(', '),write_str(A),write(', '),
		write_str(A),write(', '),write(N).

pr5_2:-read_str(A,N),count_words(A,K),write(K).

count_words(A,K):-count_words(A,0,K).

count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],I1 is I+1,count_words(A2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).

get_words(A,Words,K):-get_words(A,[],Words,0,K).

get_words([],B,B,K,K):-!.
get_words(A,Temp_words,B,I,K):-
	skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
	I1 is I+1,append(Temp_words,[Word],T_w),get_words(A2,T_w,B,I1,K),!.
get_words(_,B,B,K,K).

pr5_3:-read_str(A,N),get_words(A,Words,K),uniq_el(Words,Uniq_words),count_elems(Words,Uniq_words,Counts),
		max_in_list(Counts,Imax),el_no(Uniq_words,Imax,Word),write_str(Word).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

uniq_el(Ref,Res):-uniq_el(Ref,Res,[]).
uniq_el([],Res,Res):-!.
uniq_el([H|T],Res,Cur):-check(H,Cur,Cur,R), uniq_el(T,Res,R).
check(El,[El|_],Ref,Ref):-!.
check(El,[],Ref,R):-append(Ref,[El],R),!.
check(El,[_|T],Ref,R):-check(El,T,Ref,R).

count_elems(_,[],[]):-!.
count_elems(A,[H|T],[Cur|Tail]):-count_el(H,A,Cur),count_elems(A,T,Tail).

count_el(El,List,Count):-count_el(El,List,Count,0).
count_el(_,[],Count,Count):-!.
count_el(El,[El|T],Count,Cur):-Cur1 is Cur+1, count_el(El,T,Count,Cur1),!.
count_el(El,[_|T],Count,Cur):-count_el(El,T,Count,Cur).

max_in_list([H|T],Imax):-max_in_list(T,H,1,2,Imax).
max_in_list([],_,Cur,_,Cur):-!.
max_in_list([H|T],Max,Cur,Ind,Imax):-H>Max,Ind1 is Ind+1,max_in_list(T,H,Ind,Ind1,Imax),!.
max_in_list([_|T],Max,Cur,Ind,Imax):-Ind1 is Ind+1,max_in_list(T,Max,Cur,Ind1,Imax).

read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).
r_str_f(-1,A,A,N,N,0):-!.
r_str_f(10,A,A,N,N,1):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).

read_list_str(List,List_len):-read_str_f(A,N,Flag),r_l_s(List,List_len,[A],[N],Flag).
r_l_s(List,List_len,List,List_len,0):-!.
r_l_s(List,List_len,Cur_list,Cur_list_len,_):-
	read_str_f(A,N,Flag),append(Cur_list,[A],C_l),append(Cur_list_len,[N],C_l_l),
	r_l_s(List,List_len,C_l,C_l_l,Flag).



pr5_6:-	see('c:/Prolog/29_1_prolog_F/29_1.txt'),read_list_str(List,List_len),seen,
		tell('c:/Prolog/29_1_prolog_F/test.txt'),write_list_str(List),told.

build_all_razm_p:-
		read_str(A,N),read(K),b_a_rp(A,K,[]).
		
b_a_rp(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

build_all_perm:-
		read_str(A,N),b_a_r(A,[]).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

b_a_r([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,Perm):-in_list_exlude(A,El,A1),b_a_r(A1,[El|Perm]).
/* ����� ������������� �������� � ������ ��������� � 1 */
build_all_razm:-
		read_str(A,N),read(K),b_a_r(A,K,[]).
		
b_a_r(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,N,Perm):-in_list_exlude(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,K,B):-read(X),append(B,[X],B1),K1 is K+1,r_list(A,N,K1,B1).

pr_subset:-read(N),r_list(A,N),sub_set(B,A),write(B),nl,fail.

build_all_sochet:-
	read_str(A,N),read(K),sochet(B,A,K),write_str(B),nl,fail.

sochet([],_,0).
sochet([H|Sub_set],[H|Set],K):-K1 is K-1, sochet(Sub_set,Set,K1).
sochet(Sub_set,[H|Set],K):-sochet(Sub_set,Set,K).

pr7_7:- List=[_,_,_,_],
	(
	(	(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white])
	);
	(	(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))
	);
	(
		(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))
		
	);
	(
		(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))
		
	);
	(
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))
	)
	),
	write(List).





















