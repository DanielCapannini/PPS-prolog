succ(X, s(X)).
sum(X, zero, X).
sum(X, s(Y), s(Z)) :- sum(X, Y, Z).
mul(X, zero, zero).
mul(X, s(Y), Z) :- mul(X, Y, W), sum(W, X, Z).
dec(s(X), X).
factorial(zero, s(zero)).
factorial(s(X), Y):-factorial(X, Z), mul(s(X), Z, Y).

% relates a list with one of its elements
find(cons(E, _), E).
find(cons(_, T),E) :- find(T, E).

% relates a list with with one of its elements and its Peano position
position(cons(E, _), zero, E).
position(cons(H, T), s(N), E) :- position(T, N, E).

% relates two lists with their concatenation (similar to append)
concat(nil, L, L).
concat(cons(H, T), L, cons(H, M)):- concat(T, L, M).

% relates a list and an element with occurrences
count(nil, E, zero).
count(cons(E, L), E, s(N)) :- count(L, E, N).
count(cons(E, L), E2, N) :- E \= E2, count(L, E2, N).

%1.1
search(X, cons(X, _)).
search(X, cons(_, Xs)) :- search(X, Xs).

%1.2
search2(X, cons(X, cons(X, _))).
search2(X, cons(_, Xs)) :- search2(X, Xs).

%1.3
search_two(X, cons(X, cons(_, cons(X, _)))).
search_two(X, cons(_, Xs)) :- search_two(X, Xs).

%1.4
search_anytwo(X, cons(X, Ys)) :- search(X, Ys).
search_anytwo(X, cons(_, Xs)) :- search_anytwo(X, Xs).

%2.1
size(nil, zero).
size(cons(_, Y), s(X)):- size(Y,X).

%2.2
sum_list(nil, zero).
sum_list(cons(zero,Ys), X):- sum_list(Ys,X).
sum_list(cons(s(Y),Ys), s(X)) :- sum_list(cons(Y,Ys),X).

%2.3
count(List, E, N) :- count(List, E, zero, N).
count(nil, E, N, N).
count(cons(E, L), E, N, M) :- count(L, E, s(N), M).
count(cons(E, L), E2, N, M) :- E \= E2, count(L, E2, N, M).

%2.4
maxe(Max,zero).
maxe(s(Max),s(Min)):- max(Max,Min).

max(List, Max):- max(List, zero, Max).
max(nil, Max, Max).
max(cons(X, Xs), TempMax, Max):- maxe(X,TempMax), max(Xs,X,Max).
max(cons(_, Xs), TempMax, Max):- max(Xs,TempMax,Max).

min(List, Mim):- min(List, zero, Mim).
min(nil, Mim, Mim).
min(cons(X, Xs), TempMin, Mim):- maxe(TempMin,X), min(Xs,X,Mim).
min(cons(_, Xs), TempMin, Mim):- min(Xs,TempMin,Mim).

%2.5
min_max(nil,Min,Max).
min_max(List,Min,Max):- min(List,Min),max(List,Max), min_max(nil, Min, Max).

%3.1
same(nil,nil).
same(cons(X,Xs), cons(X,Ys)):- same(Xs,Ys).

%3.2
all_bigger(nil, nil).
all_bigger(cons(X,Xs),cons(Y,Ys)):- maxe(X,Y), all_bigger(Xs,Ys).
all_bigger(cons(X,Xs),cons(Y,Ys)):- all_bigger(nil,Ys).

%3.3
sublist(nil,List2).
sublist(cons(X,Xs),List2):- search(X,List2), sublist(Xs,List2).
sublist(cons(X,Xs),List2):- sublist(Xs,nil).

%4.1
seq(zero, _, nil).
seq(s(N), E, cons(E,T)) :- seq(N, E, T).

%4.2
seqR(zero,nil).
seqR(s(N), cons(N, Xs)):- seqR(N, Xs).

%4.3
last(nil, X, cons(X,nil)).
last(cons(Y,Ys), X, cons(Y,Xs)):- last(Ys, X, Xs).

seqR2(zero,nil).
seqR2(s(N),List):- last(Ys, N, List), seqR2(N, Ys).
