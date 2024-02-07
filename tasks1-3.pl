
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

% new facts
grandparent(voeneg, svyatoslav).
grandparent(voeneg, dobrozhir).
grandparent(voeneg, bogomil).
grandparent(voeneg, bozhedara).
grandparent(voeneg, broneslava).
grandparent(voeneg, veselina).
grandparent(voeneg, zdislava).
grandparent(voeneg, zlatomir).
grandparent(goluba, svyatoslav).
grandparent(goluba, dobrozhir).
grandparent(goluba, bogomil).
grandparent(goluba, bozhedara).
grandparent(goluba, broneslava).
grandparent(goluba, veselina).
grandparent(goluba, zdislava).
grandparent(goluba, zlatomir).




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


%father(+X, +Y)
father(X, Y):- parent(X, Y), man(X), true.

%father(+X)
father(X):- parent(Y, X), man(Y), write(Y), !.

%wife(+X, +Y)
wife(X, Y):- parent(X, Z), parent(Y, Z), woman(X), man(Y), true.

%wife(+X)
wife(X):- man(X), parent(X, Z), parent(Y, Z), woman(Y), write(Y), !.


%grand_ma(+X, +Y)
grand_ma(X, Y):- parent(Z, Y), parent(X, Z), woman(X), true.

%grand_ma_ver2(+X, +Y)
grand_ma_ver2(X, Y):- mother(X, Z), mother(Z, Y), true.

%grand_mas(+X)
grand_mas(X):- mother(Y, X), mother(Z, Y), write(Z), nl, fail.

%grand_pa_and_da(+X, +Y)
grand_pa_and_da(X, Y):- grandparent(X, Y), man(X), woman(Y), true.
grand_pa_and_da(X, Y):- grandparent(Y, X), man(Y), woman(X), true.

%grand_pa_and_da_ver2(+X, +Y)
grand_pa_and_da_ver2(X, Y):- wife(Z, X), grand_ma(Z, Y), woman(Y), true.
grand_pa_and_da_ver2(X, Y):- woman(X), grand_ma(Z, X), wife(Z, Y), true.




























