%p(+X, -Y)
%DESCRIPTION:
%Пентагональные числа P(n)=n(3n-1)/2
%P(n)<1.000.000, найти пару P(i),P(j) => (P(i)+P(j)) is P(n) and P(i)-P(j) is P(n),
%|i-j|->min, max(n) - 816
p(X, Y):- Y is (X*(3*X-1)/2).

%D=1+24P, x1 = 1+sqrt(1+24P)/6, 
%if (x1 is int and x1 mod 6 ==0)-> vse horosho
is_p(P):- X is integer((1+sqrt(1+24*P))/6), p(X, Y), Y=:=P.

find_p:- find_p(1, 1, 1, X, Y), write(X, Y).

find_p(817, _, _, _, _):- !, fail.
find_p(_, 817, _, _, _):- !, fail.
find_p(_, _, 817, _, _):- !, fail.

find_p(N1, N2, N3, X, Y):-
    3 * (N1 * N1 + N2 * N2 - N3 * N3) =:= N1 + N2 - N3,
    p(N1, X), p(N2, Y), !.




