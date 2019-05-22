% Zad. 1
sm([],[],[]).
sm([A|L1],[B|L2],[C|L3]) :- C is A+B,sm(L1,L2,L3).

% Zad. 2
% a)
rowne(N1,N2):-length(N1,What),length(N2,What).
% b)
rowne1([],[]).
rowne1([_|L1],[_|L2]) :- rowne1(L1, L2).

% Zad. 3
max([Head], Head).
max([Head|Tail], Head):- max(Tail, X), Head >= X.
max([Head|Tail], X):- max(Tail, X), X > Head.

% Zad. 4
poczatek([Head],[Head|_]).
poczatek([Head1|Tail1],[Head2|Tail2]) :- Head1 == Head2, poczatek(Tail1,Tail2).

% Zad. 5
permute([], []).
permute([X|Rest], L) :- permute(Rest, L1),select(X, L, L1).

flatten2([], []) :- !.
flatten2([L|Ls], FlatL) :- !,flatten2(L, NewL),flatten2(Ls, NewLs),append(NewL, NewLs, FlatL).flatten2(L, [L]).

sum_list([], 0).
sum_list([H|T], Sum) :- sum_list(T, Rest),Sum is H + Rest.

quicksort([], []).
quicksort([Head|Tail], Sorted) :- pivot(Head, Tail, List1, List2), quicksort(List1, SortedList1),!, quicksort(List2, SortedList2),!, append(SortedList1, [Head|SortedList2], Sorted).
pivot(_, [], [], []).
pivot(Pivot, [Head|Tail], [Head|LessOrEqualThan], GreaterThan) :- Pivot >= Head, pivot(Pivot, Tail, LessOrEqualThan, GreaterThan). 
pivot(Pivot, [Head|Tail], LessOrEqualThan, [Head|GreaterThan]) :- pivot(Pivot, Tail, LessOrEqualThan, GreaterThan).

merge_sort([],[]).     
merge_sort([X],[X]). 
merge_sort(List,Sorted):-List=[_,_|_],divide(List,L1,L2),merge_sort(L1,Sorted1),merge_sort(L2,Sorted2),merge(Sorted1,Sorted2,Sorted).                  % and sorted parts are merged
merge([],L,L).
merge(L,[],L):-L\=[].
merge([X|T1],[Y|T2],[X|T]):-X=<Y,merge(T1,[Y|T2],T).
merge([X|T1],[Y|T2],[Y|T]):-X>Y,merge([X|T1],T2,T).
divide(L,L1,L2):-even_odd(L,L1,L2).
even_odd([],[],[]).
even_odd([H|T],E,[H|O]):-even_odd(T,O,E).

% Zad. 6
iloczyn([],_,[]).
iloczyn([Head1|Tail1], Y, [Head1|Tail]) :- member(Head1, Y), iloczyn(Tail1, Y, Tail).
iloczyn([_|Tail], Y, Z) :- iloczyn(Tail, Y, Z),!.

suma([],[],[]).
suma(X, Y, [Head|Tail]) :- (member(Head,X); member(Head,Y)), delete(X,Head,X1), delete(Y,Head,Y1), suma(X1,Y1,Tail), !.

roznica(X,X,[]).
roznica([Head|Tail],Y,[]) :- member(Head,Y), roznica(Tail,Y,[]), !.
roznica(X,[Head|Tail],X) :- not(member(Head,X)), roznica(X, Tail, X), !.
roznica(X,Y,[Head|Tail]) :- member(Head,X), not(member(Head,Y)), delete(X,Head,X1), roznica(X1,Y,Tail), !.
