likes(john, pizza).
likes(sarah, sushi).
likes(mike, pizza).
likes(mike, sushi).
likes(emma, sushi).
likes(emma, chocolate).
likes(emma, ice_cream).
likes(peter, ice_cream).
likes(peter, chocolate).

likes_similar(X, Y) :-
    likes(X, Z),
    likes(Y, Z),
    X \= Y.
