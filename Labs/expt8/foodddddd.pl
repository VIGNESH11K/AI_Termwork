food(burger).
food(sandwich).
food(pizza).
lunch(sandwich).
dinner(pizza).

meal(X) :- food(X).

?- food(pizza).
?- meal(X), lunch(X).
?- dinner(sandwich).
