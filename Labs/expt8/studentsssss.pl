student(anna, math).
student(john, physics).
student(sarah, math).
student(mike, biology).
student(emma, physics).
student(peter, chemistry).

teacher(professor_smith, math).
teacher(professor_jones, physics).
teacher(professor_davis, biology).
teacher(professor_white, chemistry).

% Rules
teaches(Teacher, Subject) :-
    teacher(Teacher, Subject).

teaches_student(Teacher, Student) :-
    teaches(Teacher, Subject),
    student(Student, Subject).
