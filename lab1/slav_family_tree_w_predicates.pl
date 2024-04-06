
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

