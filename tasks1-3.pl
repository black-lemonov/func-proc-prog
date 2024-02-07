
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


men:- man(X), write(X), nl, fail.

women:- woman(Y), write(Y), nl, fail.

% комментарий
% children(+X)
% +X - переменная унифицированная
% -X - переменная неунифицированная
% ?X - ?
children(X):- parent(X, Y), write(Y), nl, fail.

%mother(+X,+Y)
mother(X,Y):- parent(X,Y), woman(X), true.

%mother(+X)
mother(X):- parent(Y,X), woman(Y), write(Y).

%brother(+X,+Y)
brother(X,Y):- man(X), X \== Y, man(Y), parent(Z, X), parent(Z, Y), true.

%brothers(+X)
brothers(X):-
    man(X), parent(Z, X), parent(Z, Y), woman(Z), X \== Y, man(Y), write(Y), nl, fail.

%b_s(+X, +Y)
b_s(X, Y):- X \== Y, parent(Z, X), parent(Z, Y), true.

%b_s(+X)
b_s(X):- parent(Z, X), parent(Z, Y), X \== Y, woman(Z), write(Y), nl, fail.







































