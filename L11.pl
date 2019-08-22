% Zad. 1
liczba_naturalna(0).
liczba_naturalna(s(X)):-liczba_naturalna(X).

plus(0,N,N).
plus(s(X),Y,s(Z)) :- plus(X,Y,Z).

% Zad. 2
razy(0,_,0).
razy(s(X),Y,Z) :-razy(X,Y,K),plus(K,Y,Z).

% Zad. 3
ln(0,0).
ln(s(M),N) :- ln(M, Z),N is Z+1.

% Zad. 4
liscie(nil,0).
liscie(tree(_,nil,nil),1) :- !.
liscie(tree(_,L,R),N) :- liscie(L,NL), liscie(R,NR), N is NL+NR.

% Zad. 5
:-op(220, fy, neg).
:-op(240, xfy, [and, or]).
:-op(260, xfy, [imp, iff]).

z(p,0).
z(q,0).
z(r,0).
z(s,0).
z(t,0).
z(neg X,N) :- z(X,N1),N is N1+1.
z(X and Y,N) :- z(X,N1),z(Y,N2),N is N1+N2+1.
z(X or Y,N) :- z(X,N1),z(Y,N2),N is N1+N2+1.
z(X imp Y,N) :- z(X,N1),z(Y,N2),N is N1+N2+1.
z(X iff Y,N) :- z(X,N1),z(Y,N2),N is N1+N2+1.

% Zad. 6
%fakty
:-op(220,fy,neg).
neg(1,0).
neg(0,1).

:-op(240,xfy,and).
and(0,0,0).
and(1,0,0).
and(0,1,0).
and(1,1,1).

:-op(240,xfy,or).
or(0,0,0).
or(1,0,1).
or(0,1,1).
or(1,1,1).

:-op(260,xfy,imp).
imp(1,0,0).
imp(0,0,1).
imp(0,1,1).
imp(1,1,1).

:-op(260,xfy,iff).
iff(1,1,1).
iff(0,0,1).
iff(1,0,0).
iff(0,1,0).
%rekurencja
