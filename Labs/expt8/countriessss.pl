% Facts about countries and their capitals
capital(paris, france).
capital(berlin, germany).
capital(london, uk).
capital(rome, italy).
capital(madrid, spain).

% Facts about languages spoken in countries
language(france, french).
language(germany, german).
language(uk, english).
language(italy, italian).
language(spain, spanish).

% Facts about currencies used in countries
currency(france, euro).
currency(germany, euro).
currency(uk, pound_sterling).
currency(italy, euro).
currency(spain, euro).

speaks_same_language(Country1, Country2) :-
    capital(Capital, Country1),
    capital(Capital, Country2),
    Country1 \= Country2,
    language(Country1, Language),
    language(Country2, Language).

shares_same_currency(Country1, Country2) :-
    currency(Country1, Currency),
    currency(Country2, Currency),
    Country1 \= Country2.