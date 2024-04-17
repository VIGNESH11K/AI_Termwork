car(chevrolet, camaro, 2019, red).
car(chevrolet, corvette, 2020, blue).
car(ford, mustang, 2018, yellow).
car(ford, focus, 2017, silver).
car(toyota, corolla, 2019, black).
car(toyota, rav4, 2021, white).

% Rules
manufacturer(Make, Model, Year, Color) :-
    car(Make, Model, Year, Color).

car_color(Model, Color) :-
    car(_, Model, _, Color).

car_year(Model, Year) :-
    car(_, Model, Year, _).