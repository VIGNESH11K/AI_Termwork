employee(john, 2000).
employee(sarah, 2500).
employee(mike, 3000).
employee(emma, 2800).
employee(peter, 2200).

salary_above_average(Employee) :-
    employee(Employee, Salary),
    average_salary(Average),
    Salary > Average.

average_salary(Average) :-
    findall(Salary, employee(_, Salary), Salaries),
    sum_list(Salaries, Total),
    length(Salaries, Count),
    Average is Total / Count.