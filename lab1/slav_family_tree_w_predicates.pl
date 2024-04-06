
man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).



% men/0
men:- man(X), write(X), nl, fail.


% women/0
women:- woman(Y), write(Y), nl, fail.


% +X - unified
% -X - not unified
% ?X - unified or not unified


% children(+X)
% DESCRIPTION:
% writes X's children
children(X):- parent(X, Y), write(Y), nl, fail.


% mother(?X, +Y)
% DESCRIPTION:
% checks if X is Y's mother
% or finds Y's mother
mother(X,Y):- parent(X,Y), woman(X), true.


% mother(+X)
% DESCRIPTION:
% writes X's mother
mother(X):- mother(Y, X), write(Y), !.


% brother(?X, +Y)
% DESCRIPTION:
% checks if X is Y's brother
% or finds Y's brother
brother(X,Y):- man(X), parent(Z, Y), woman(Z), parent(Z, X), X \== Y, true.


% brothers(+X)
% DESCRIPTION:
% writes X's brothers
brothers(X):- brother(Y, X), write(Y), nl, fail.


% b_s(?X, +Y)
% DESCRIPTION:
% checks if X is Y's brother or sister
% or finds Y's brother or sister
b_s(X, Y):- parent(Z, X), woman(Z), parent(Z, Y), X \== Y, true.


% b_s(+X)
% DESCRIPTION:
% writes X's brothers and sisters
b_s(X):- b_s(Y,X), write(Y), nl, fail.


% father(?X, +Y)
% DESCRIPTION:
% checks if X is Y's father
% or finds Y's father
father(X, Y):- parent(X, Y), man(X), true.


% father(+X)
% DESCRIPTION:
% writes X's father
father(X):- father(Y,X), write(Y), !.

% wife(?X, +Y)
% DESCRIPTION:
% checks if X is Y's wife
% or finds Y's wife
wife(X, Y):- parent(X, Z), parent(Y, Z), woman(X), man(Y), true.


% wife(+X)
% DESCRIPTION:
% write X's wife
wife(X):- wife(Y, X), write(Y), !.


% grand_ma(?X, ?Y)
% DESCRIPTION:
% checks if X is Y's grandmother using facts
% or finds Y's grandmother
grand_ma(X, Y):- parent(Z, Y), parent(X, Z), woman(X), true.


% grand_ma_ver2(?X, ?Y)
% DESCRIPTION:
% checks if X is Y's grandmother using predicate
% or finds Y's grandmother
grand_ma_ver2(X, Y):- parent(Z,Y), mother(X,Z), true.


% grand_mas(+X)
% DESCRIPTION:
% writes X's grandmothers using facts
grand_mas(X):- grand_ma(Y, X), write(Y), nl, fail.


% grand_mas_ver2(+X)
% DESCRIPTION:
% writes X's grandmothers using predicates
grand_mas_ver2(X):- grand_ma_ver2(Y,X), write(Y), nl, fail.


% grand_pa_and_da(+X, +Y)
% DESCRIPTION:
% checks if X and Y are grandpa and granddaughter and vice versa using facts
grand_pa_and_da(X, Y):- man(X), parent(X, Z), parent(Z, Y), woman(Y), true.
grand_pa_and_da(Y, X):- woman(Y), parent(Z, Y), parent(X, Z), man(X), true.


% grand_pa_and_da_ver2(+X, +Y)
% DESCRIPTION:
% checks if X and Y are grandpa and granddaughter and vice versa using predicates
grand_pa_and_da_ver2(X, Y):- wife(Z,X), grand_ma(Z,Y), woman(Y), true.
grand_pa_and_da_ver2(Y, X):- woman(Y), grand_ma(Z,Y), wife(Z,X), true.


% niece(?X, +Y)
% DESCRIPTION:
% checks if X is Y's niece using facts
% or finds Y's niece
niece(X, Y):- parent(Z,Y), woman(Z), parent(Z,W), Y\==W, parent(W,X), woman(X), true.


% niece_ver2(?X, +Y)
% DESCRIPTION:
% checks if X is Y's niece using predicates
% or finds Y's niece
niece_ver2(X, Y):- b_s(Z, Y), parent(Z, X), woman(X), true.


% nieces(+Y)
% DESCRIPTION:
% writes all Y's nieces using facts
nieces(Y):- niece(X,Y), write(X), nl, fail.


% nieces_ver2(+Y)
% DESCRIPTION:
% writes all Y's nieces using predicates
nieces_ver2(Y):- niece_ver2(X,Y), write(X), nl, fail.
