% Autor:
% Datum: 13.04.2019
kind(franka, adolf, eva).
kind(werner, hartmut, gretel).
kind(reke, hartmut, gretel).
kind(olga, hartmut, gretel).

kind(lisa, werner, franka).
kind(rudolf, werner, franka).

m�nnlich(reke).
m�nnlich(werner).
m�nnlich(hartmut).
m�nnlich(rudolf).

weiblich(lisa).
weiblich(gretel).
weiblich(franka).
weiblich(olga).

vater(R, Y) :- kind(Y, R, X).
mutter(R, Y) :- kind(Y, X, R).
tochter(X, R) :- kind(X, R, Y), weiblich(X).
tochter(X, R) :- kind(X, Y, R), weiblich(X).
sohn(X, R) :- kind(X, R, Y), m�nnlich(X).
sohn(X, R) :- kind(X, Y, R), m�nnlich(X).
bruder(X, R) :- kind(X, A, B), kind(R, A, B), m�nnlich(X), X \== R.
schwester(X, R) :- kind(X, A, B), kind(R, A, B), weiblich(X), X \== R.

onkel(X, R) :- bruder(X, Y), mutter(Y, R).
onkel(X, R) :- bruder(X, Y), vater(Y, R).

tante(X, R) :- schwester(X, Y), mutter(Y, R).
tante(X, R) :- schwester(X, Y), vater(Y, R).

gro�vater(X, R) :- vater(X, Y), vater(Y, R).
gro�vater(X, R) :- vater(X, Y), mutter(Y, R).

gro�mutter(X, R) :- mutter(X, Y), mutter(Y, R).
gro�mutter(X, R) :- mutter(X, Y), vater(Y, R).