% Zad. 1
sm([],[],[]).
sm([A|L1],[B|L2],[C|L3]) :- C is A+B,sm(L1,L2,L3).

% Zad. 2
% a)
rowne(N1,N2):-length(N1,X),length(N2,X).
% b)
rowne1([],[]).
rowne1([_|L1],[_|L2]) :- rowne1(L1, L2).

% Zad. 3
max([Head], Head).
max([Head|Tail], Head):- max(Tail, X), Head >= X,!.
max([Head|Tail], X):- max(Tail, X), X > Head,!.

% Zad. 4
poczatek([],[_|_]).
poczatek([Head],[Head|_]).
poczatek([Head1|Tail1],[Head2|Tail2]) :- Head1 == Head2, poczatek(Tail1,Tail2),!.

% Zad. 5
permutuj([], []).
permutuj([X|R], L) :- permutuj(R, L1),select(X, L, L1).

flatten2(List, F) :-flatten2(List, [], F0),!,F = F0.
flatten2(Var, Tl, [Var|Tl]) :-var(Var),!.
flatten2([], Tl, Tl) :- !.
flatten2([Hd|Tl], Tail, L) :-!,flatten2(Hd, F, L),flatten2(Tl, Tail, F).
flatten2(N, Tl, [N|Tl]).

sum_list([], 0).
sum_list([H|T], S) :- sum_list(T, R),S is H + R.

mysort([],[]).
mysort(L,T) :- list_to_set(L,W),m_sort(W,T).

m_sort([], []).
m_sort([Head|Tail], Sorted) :- pivot(Head, Tail, List1, List2), m_sort(List1, SortedList1),!, m_sort(List2, SortedList2),!, append(SortedList1, [Head|SortedList2], Sorted).
pivot(_, [], [], []).
pivot(Pivot, [Head|Tail], [Head|LessOrEqualThan], GreaterThan) :- Pivot >= Head, pivot(Pivot, Tail, LessOrEqualThan, GreaterThan). 
pivot(Pivot, [Head|Tail], LessOrEqualThan, [Head|GreaterThan]) :- pivot(Pivot, Tail, LessOrEqualThan, GreaterThan).

% Zad. 6
iloczyn([],_,[]).
iloczyn([Head1|Tail1], Y, [Head1|Tail]) :- member(Head1, Y), iloczyn(Tail1, Y, Tail),!.
iloczyn([_|Tail], Y, Z) :- iloczyn(Tail, Y, Z),!.

suma([],[],[]).
suma(X, Y, [Head|Tail]) :- (member(Head,X); member(Head,Y)), delete(X,Head,X1), delete(Y,Head,Y1), suma(X1,Y1,Tail), !.

roznica(X,X,[]).
roznica([Head|Tail],Y,[]) :- member(Head,Y), roznica(Tail,Y,[]), !.
roznica(X,[Head|Tail],X) :- not(member(Head,X)), roznica(X, Tail, X), !.
roznica(X,Y,[Head|Tail]) :- member(Head,X), not(member(Head,Y)), delete(X,Head,X1), roznica(X1,Y,Tail), !.
