/*zad2
a)
?- student(X, Y, _, _, informatyka, _).
X = kaczmarek,
Y = janina ;
X = nowak,
Y = anna ;
X = jurkowski,
Y = jerzy ;
X = zemski,
Y = piotr ;
X = makowska,
Y = zuzanna ;
X = ratajczak,
Y = agata.
b)
?- student(X, Y, _, Z, _, _), Z \= poznan.
X = nowak,
Y = anna,
Z = olsztyn ;
X = kot,
Y = stefan,
Z = warszawa ;
X = typowski,
Y = adam,
Z = krakow ;
c)
?- student(X, Y, Z, _, _, _), Z > 1990.
X = kosowski,
Y = jan,
Z = 1991 ;
X = kowalski,
Y = marek,
Z = 1993 ;
X = zemski,
Y = piotr,
Z = 1991 ;
X = ratajczak,
Y = agata,
Z = 1992.
d)
?- student(Z, Y, _, poznan, _, X), (X = pp ; X = uam).
Z = kowalski,
Y = jan,
X = uam ;
Z = kowalski,
Y = marek,
X = pp ;
Z = kaczmarek,
Y = janina,
X = pp ;
Z = jurkowski,
Y = jerzy,
X = uam ;
Z = wolski,
Y = maciej,
X = pp ;
Z = makowska,
Y = zuzanna,
X = pp ;
Z = ratajczak,
Y = agata,
X = uam.
e)
?- student(_, _, _, A, informatyka, C).
A = poznan,
C = pp ;
A = olsztyn,
C = uwm ;
A = poznan,
C = uam ;
A = poznan,
C = ue ;
A = poznan,
C = pp ;
A = poznan,
C = uam.
C = uam.

f)
?- student(_, _, _, łódź, matematyka, _).
false.
g)
?- student(kowalski, jan, _, _, matematyka, _).
true .

relacje
a)
wszy(X,Y):-student(X, Y, _, poznan, _, _).
X = kowalski,
Y = jan ;
X = kosowski,
Y = jan ;
X = kowalski,
Y = marek ;
X = kaczmarek,
Y = janina ;
X = jurkowski,
Y = jerzy ;
X = wolski,
Y = maciej ;
X = zemski,
Y = piotr ;
X = makowska,
Y = zuzanna ;
X = ratajczak,
Y = agata.
b)
wszyprzed(X,Y):-student(X, Y, Z, poznan, informatyka, _), Z < 1994.
X = kaczmarek,
Y = janina,
X = jurkowski,
Y = jerzy,
X = zemski,
Y = piotr,
X = makowska,
Y = zuzanna,
X = ratajczak,
Y = agata,
c)
polit(X,Y):-student(X, Y, _, _, informatyka, pp).
X = kaczmarek,
Y = janina ;
X = makowska,
Y = zuzanna ;
false.
d)
uczel(X):-student(_, _, _, _, matematyka, X).
X = uam ;
X = ae ;
X = pp ;
X = pp ;
X = uw ;
X = uj.
*/
% zad3
ojciec(X, Y):-mezczyzna(X), rodzic(X, Y).
matka(X, Y):-kobieta(X), rodzic(X, Y).
rodzenstwo(X, Y):-rodzic(Z, X), rodzic(Z, Y), X\=Y.
brat(X,Y) :-mezczyzna(X), rodzenstwo(X,Y).
siostra(X,Y) :-kobieta(X), rodzenstwo(X,Y).
dziadek(X, Y):-ojciec(X,Z),rodzic(Z,Y).
babcia(X, Y):-matka(X,Z),rodzic(Z,Y).
dziadkowie(X,Y,Z) :-dziadek(X,Z),babcia(Y,Z).
wuj(X, Y) :- brat(X, Z), rodzic(Y, Z).
kuzyn(Child1,Child2) :-mezczyzna(Child1),rodzic(Y1,Child1),rodzic(Y2,Child2),rodzenstwo(Y1,Y2).
przodek(X, Y) :- rodzic(X, Y).
przodek(X, Y) :- rodzic(X, Z), przodek(Z, Y).

% zad4
jarosz(ola).
jarosz(pawel).
jarosz(jan).
jarosz(ewa).

kawa(iza).
kawa(piotr).
kawa(pawel).

ksiazki(ola).
ksiazki(iza).
ksiazki(pawel).

sport(iza).
sport(ola).
sport(piotr).
sport(pawel).

lubi(ola,X) :- jarosz(X), sport(X).
lubi(ewa,X) :- not(kawa(X)), jarosz(X).
lubi(iza, X) :- ksiazki(X); (sport(X), not(kawa(X))).
lubi(janek, X) :- sport(X).
lubi(piotr, X) :- (jarosz(X), sport(X)); (ksiazki(X)).
lubi(pawel, X) :- jarosz(X), sport(X), ksiazki(X).

przyjaciele(X,Y) :- lubi(X,Y), lubi(Y,X), X\=Y.

% zad7
/*Tak mozna użyć select do dodawania elementu do listy.
W ten sposób:

?- select(10,X,[1,2,3])
|    .
X = [10, 1, 2, 3] .
*/

% zad8
jest_list(X) :- var(X), !,fail.
jest_list([]).
jest_list([_|T]) :- jest_list(T).

ostatni([X|Xs], Last) :- ostatni_(Xs, X, Last).
ostatni_([], Last, Last).
ostatni_([X|Xs], _, Last) :- ostatni_(Xs, X, Last).

nalezy(X,[X|_]).
nalezy(X,[_|T]) :- nalezy(X,T).

obok(X, Y, [X,Y|_]).
obok(X, Y, [_|Zs]) :- obok(X, Y, Zs).

usun(A, [A|B], B).
usun(A, [B, C|D], [B|E]) :- usun(A, [C|D], E).

wybierz(El,[El|T],T).
wybierz(El,[H|T],[H|S]) :- wybierz(El,T,S).

listanum(L, U, Ns) :- must_be(integer, L),must_be(integer, U),L =< U,listanum_(L, U, Ns).
listanum_(U, U, List) :-!,List = [U].
listanum_(L, U, [L|Ns]) :-L2 is L+1,listanum_(L2, U, Ns).