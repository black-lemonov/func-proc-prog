
/*
  В бутылке, стакане, кувшине и банке находятся молоко, лимонад, 
  квас и вода. Известно, что вода и молоко не в бутылке,
  сосуд с лимонадом находится между кувшином и сосудом с квасом,
  в банке - не лимонад и не вода. Стакан находится около
  банки и сосуда с молоком. Как распределены эти жидкости по сосудам. 
*/ 

solve:-
  Vessels = [ _, _, _, _],
	member([bottle, Drink1], Vessels),
  member([glass, Drink2], Vessels),
  member([jug, Drink3], Vessels),
  member([jar, Drink4], Vessels),

  member([_, milk], Vessels),
  member([_, lemonade], Vessels),
  member([_, kvas], Vessels),
  member([_, water], Vessels),
  % Вода и молоко не в бутылке
  Drink1 \= water,
  Drink1 \= milk,
  % Сосуд с лимонадом находится между кувшином и сосудом с квасом
  Drink3 \= lemonade,
  Drink3 \= kvas,

  % В банке - не лимонад и не вода
  Drink4 \= lemonade,
  Drink4 \= water,
  % Стакан находится около банки и сосуда с молоком
  Drink2 \= milk,
  Drink4 \= milk,

  write(Drink1), write(" in bottle"), nl,
  write(Drink2), write(" in glass"), nl,
  write(Drink3), write(" in jug"), nl,
  write(Drink4), write(" in jar"), nl.
