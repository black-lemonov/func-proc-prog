rank(naruto, 1).
rank(kiba, 2).
rank(rocklee, 2).
rank(kakashi, 3).
rank(itachi, 3).
rank(gaara, 6).
rank(temari, 3).
rank(kankuro, 3).
rank(hidan, 3).
rank(kisame, 3).
rank(dzhiraya, 5).
rank(orachimaru, 5).
rank(haku, 7).
rank(zabuza, 3).
rank(suigetsu, 2).
rank(sai, 4).
rank(deidara, 3).
rank(sakura, 2).
rank(hinata, 2).
rank(tenten, 2).
rank(neji, 2).

village(naruto, 1).
village(kiba, 1).
village(rocklee, 1).
village(kakashi, 1).
village(itachi, 1).
village(gaara, 2).
village(temari, 2).
village(kankuro, 2).
village(hidan, 5).
village(kisame, 4).
village(dzhiraya, 1).
village(orachimaru, 1).
village(haku, 6).
village(zabuza, 4).
village(suigetsu, 4).
village(sai, 1).
village(deidara, 3).
village(sakura, 1).
village(hinata, 1).
village(tenten, 1).
village(neji, 1).

jutsu(naruto, 1).
jutsu(kiba, 1).
jutsu(rocklee, 2).
jutsu(kakashi, 1).
jutsu(itachi, 3).
jutsu(gaara, 1).
jutsu(temari, 1).
jutsu(kankuro, 1).
jutsu(hidan, 5).
jutsu(kisame, 4).
jutsu(dzhiraya, 1).
jutsu(orachimaru, 5).
jutsu(haku, 1).
jutsu(zabuza, 4).
jutsu(suigetsu, 4).
jutsu(sai, 1).
jutsu(deidara, 1).
jutsu(sakura, 7).
jutsu(hinata, 6).
jutsu(tenten, 8).
jutsu(neji, 6).

branch(hinata, 1).
branch(neji, 2).

element(naruto, 1).
element(kiba, 5).
element(rocklee, 7).
element(kakashi, 3).
element(itachi, 4).
element(gaara, 5).
element(temari, 1).
element(kankuro, 6).
element(hidan, 7).
element(kisame, 2).
element(dzhiraya, 2).
element(orachimaru, 2).
element(haku, 2).
element(zabuza, 2).
element(suigetsu, 2).
element(sai, 6).
element(deidara, 6).
element(sakura, 6).
element(hinata, 1).
element(tenten, 1).
element(neji, 1).

kekkei(naruto, 3).
kekkei(kiba, 6).
kekkei(rocklee, 6).
kekkei(kakashi, 6).
kekkei(itachi, 1).
kekkei(gaara, 3).
kekkei(temari, 6).
kekkei(kankuro, 6).
kekkei(hidan, 6).
kekkei(kisame, 6).
kekkei(dzhiraya, 6).
kekkei(orachimaru, 6).
kekkei(haku, 2).
kekkei(zabuza, 6).
kekkei(suigetsu, 6).
kekkei(sai, 6).
kekkei(deidara, 4).
kekkei(sakura, 6).
kekkei(hinata, 5).
kekkei(tenten, 6).
kekkei(neji, 5).

organization(itachi, 1).
organization(hidan, 1).
organization(kisame, 1).
organization(sai, 2).
organization(suigetsu, 3).
organization(deidara, 1).


question1(X1):- write("What's your character rank?"), nl,
				write("1. genin"), nl,
				write("2. chuunin"),nl,
				write("3. jounin"),nl,
				write("4. chuubu"),nl,
				write("5. sanin"),nl,
				write("6. kage"),nl,
				write("7. none"), nl,
				read(X1).

question2(X2):- write("What village is your character from?"), nl,
				write("1. Hidden leaf"), nl,
				write("2. Hidden sand"), nl,
				write("3. Hidden rock"), nl,
				write("4. Hidden with fog"), nl,
				write("5. Hot springs"), nl,
				write("6. none"), nl,
				read(X2).

question3(X3):- write("What's your character's jutsu?"), nl,
				write("1. ninjutsu"), nl,
				write("2. taijutsu"), nl,
				write("3. genjutsu"), nl,
				write("4. kenjutsu"), nl,
				write("5. kinjutsu"), nl,
				write("6. doujutsu"), nl,
				write("7. medic"), nl,
				write("8. shurikenjutsu"), nl,
				read(X3).

question4(X4):- write("What's your character chakra's element?"), nl,
				write("1. wind"), nl,
				write("2. water"), nl,
				write("3. lighting"), nl,
				write("4. fire"), nl,
				write("5. soil"), nl,
				write("6. yan"), nl,
				write("7. none"), nl,
				read(X4).

question5(X5):- write("What's your character's blood-inherited power?"), nl,
				write("1. sharingan"), nl,
				write("2. ice"), nl,
				write("3. biju"), nl,
				write("4. explosion"), nl,
				write("5. byakugan"), nl,
				write("6. none"), nl,
				read(X5).

question6(X6):- write("What organization is your character a member of?"), nl,
			   write("1. akatsuki"), nl,
			   write("2. anbu"), nl,
			   write("3. hebi"), nl,
			   write("4. none"), nl,
			   read(X6).

question7(X7):- write("Is your character from the main branch of the clan?"), nl,
			    write("1. yes"), nl,
			    write("2. no"), nl,
			    read(X7).


% in_list(+List, +El)
% проверяет наличие El в List
in_list([E|_], E):- !, true.
in_list([_|T], E):- in_list(T, E).


not_last(Matches):- length(Matches, 1), !, [Answer | _] = Matches, write(Answer), nl, !, fail.
not_last(_):- !, true.


pr:-	
	question1(X1), findall(X, (rank(X, X1)), Matches1), not_last(Matches1),
	question2(X2), findall(X, (rank(X, X1), village(X, X2)), Matches2), not_last(Matches2),
	question3(X3), findall(X, (rank(X, X1), village(X, X2), jutsu(X, X3)), Matches3), not_last(Matches3),
	
	(
		in_list(Matches3, hinata),
		in_list(Matches3, neji)
		-> 
		question7(X7),
		findall(X, branch(X, X7), Matches7),
		not_last(Matches7)
	),

	question4(X4), findall(X, (rank(X, X1), village(X, X2), jutsu(X, X3), element(X, X4)), Matches4), not_last(Matches4),
	question5(X5), findall(X, (rank(X, X1), village(X, X2), jutsu(X, X3), element(X, X4), kekkei(X, X5)), Matches5), not_last(Matches5),

	
	(
		in_list(Matches5, zabuza),
		in_list(Matches5, kisame)
		-> 
		question6(X6),
		findall(X, organization(X, X6), Matches6),
		not_last(Matches6), true
		;
		write("Sorry, I can't guess this character ;("), nl,
		fail
	).
