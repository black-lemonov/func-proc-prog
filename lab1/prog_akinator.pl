high(ruby,1).
high(c_sharp,1).
high(python,1).
high(c_plu_plus,1).
high(f_sharp,1).
high(prolog,1).
high(c,1).
high(asm,0).
high(swift,1).
high(javascript,1).
high(perl,1).
high(r,1).


decl(ruby,0).
decl(c_sharp,0).
decl(python,0).
decl(c_plu_plus,0).
decl(f_sharp,1).
decl(prolog,1).
decl(c,0).
decl(asm,0).
decl(swift,0).
decl(javascript,0).
decl(perl,0).
decl(r,0).


interpret(ruby,1).
interpret(python,1).
interpret(f_sharp,1).
interpret(prolog,1).
interpret(c_sharp,0).
interpret(c_plu_plus,0).
interpret(c,0).
interpret(asm,0).
interpret(swift,0).
interpret(javascript,1).
interpret(perl,1).
interpret(r,1).


oop(ruby,3).
oop(c_sharp,3).
oop(python,2).
oop(c_plu_plus,2).
oop(f_sharp,1).
oop(prolog,1).
oop(c,0).
oop(asm,0).
oop(swift,2).
oop(javascript,2).
oop(perl,2).
oop(r,2).


cross(ruby,1).
cross(python,1).
cross(c_plu_plus,1).
cross(prolog,1).
cross(c,1).
cross(asm,1).
cross(c_sharp,0).
cross(f_sharp,0).
cross(swift,1).
cross(javascript,1).
cross(perl,1).
cross(r,1).


visual(c_sharp,3).
visual(ruby,2).
visual(python,2).
visual(c_plu_plus,2).
visual(f_sharp,2).
visual(prolog,1).
visual(c,0).
visual(asm,0).
visual(swift,1).
visual(javascript,1).
visual(perl,2).
visual(r,2).


mobile(c_sharp,0).
mobile(ruby,0).
mobile(python,0).
mobile(c_plu_plus,0).
mobile(f_sharp,0).
mobile(prolog,0).
mobile(c,0).
mobile(asm,0).
mobile(swift,1).
mobile(javascript,1).
mobile(perl,0).
mobile(r,0).


performance(c_sharp,0).
performance(ruby,0).
performance(python,0).
performance(c_plu_plus,1).
performance(f_sharp,1).
performance(prolog,2).
performance(c,1).
performance(asm,1).
performance(swift,0).
performance(javascript,0).
performance(perl,0).
performance(r,1).


simplicity(ruby,0).
simplicity(c_sharp,0).
simplicity(python,1).
simplicity(c_plu_plus,0).
simplicity(f_sharp,0).
simplicity(prolog,0).
simplicity(c,0).
simplicity(asm,0).
simplicity(swift,0).
simplicity(javascript,0).
simplicity(perl,0).
simplicity(r,0).





question1(X1):-	write("Is your language high level?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X1).

question2(X2):-	write("Is your language declarative?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X2).

question3(X3):-	write("Is your language interpret?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X3).

question4(X4):-	write("Does your language support OOP?"),nl,
				write("3. It is OOP itself"),nl,
				write("2. yes"),nl,
				write("1. yes, but very hard"),nl,
				write("0. NO"),nl,
				read(X4).

question5(X5):-	write("Is your language crossplatformic?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X5).

question6(X6):-	write("Does your language support visual interface for user?"),nl,
				write("3. It is visual itself"),nl,
				write("2. yes"),nl,
				write("1. yes, but very hard"),nl,
				write("0. NO"),nl,
				read(X6).

question7(X7):-	write("Is your language for mobile phones?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X7).


question8(X8):-	write("Is your language for high-performance?"),nl,
				write("2. Hahaha"),nl,
                                write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X8).

question9(X9):-	write("Is simplicity your language main principle?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X9).





pr:-	question1(X1),question2(X2),question3(X3),question4(X4),
		question5(X5),question6(X6),question7(X7),question8(X8),
                question9(X9),
		high(X,X1),decl(X,X2),interpret(X,X3),oop(X,X4),
		cross(X,X5),visual(X,X6),mobile(X,X7), performance(X, X8),
                simplicity(X, X9),
		write(X).
