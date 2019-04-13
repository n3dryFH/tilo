% Autor:
% Datum: 13.04.2019
kind(franka, adolf, eva).
kind(werner, hartmut, gretel).
kind(reke, hartmut, gretel).
kind(olga, hartmut, gretel).

kind(lisa, werner, franka).
kind(rudolf, werner, franka).

männlich(reke).
männlich(werner).
männlich(hartmut).
männlich(rudolf).

weiblich(lisa).
weiblich(gretel).
weiblich(franka).
weiblich(olga).

vater(R, Y) :- kind(Y, R, X).
mutter(R, Y) :- kind(Y, X, R).
tochter(X, R) :- kind(X, R, Y), weiblich(X).
tochter(X, R) :- kind(X, Y, R), weiblich(X).
sohn(X, R) :- kind(X, R, Y), männlich(X).
sohn(X, R) :- kind(X, Y, R), männlich(X).
bruder(X, R) :- kind(X, A, B), kind(R, A, B), männlich(X), X \== R.
schwester(X, R) :- kind(X, A, B), kind(R, A, B), weiblich(X), X \== R.

onkel(X, R) :- bruder(X, Y), mutter(Y, R).
onkel(X, R) :- bruder(X, Y), vater(Y, R).

tante(X, R) :- schwester(X, Y), mutter(Y, R).
tante(X, R) :- schwester(X, Y), vater(Y, R).

großvater(X, R) :- vater(X, Y), vater(Y, R).
großvater(X, R) :- vater(X, Y), mutter(Y, R).

großmutter(X, R) :- mutter(X, Y), mutter(Y, R).
großmutter(X, R) :- mutter(X, Y), vater(Y, R).