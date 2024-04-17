% Define symptoms for various medical conditions
symptom(flu, fever).
symptom(flu, cough).
symptom(flu, fatigue).
symptom(cold, runny_nose).
symptom(cold, sneezing).
symptom(cold, sore_throat).
symptom(allergy, sneezing).
symptom(allergy, itchy_eyes).
symptom(allergy, rash).

% Define condition names
condition_name(flu, 'Influenza').
condition_name(cold, 'Common Cold').
condition_name(allergy, 'Allergies').

% Define rules for diagnosing conditions
diagnose(Condition) :-
    symptom(Condition, Symptom),
    ask(Symptom),
    fail. % Allow backtracking to find other possible diagnoses.
diagnose(Condition) :-
    condition_name(Condition, Name),
    write('You may have '), write(Name), write('.'), nl,
    !. % Cut to prevent backtracking once a diagnosis is made.
diagnose(_) :-
    write('Based on your symptoms, there is no diagnosis available. You may be healthy.').
    

% Ask user about symptoms
ask(Symptom) :-
    write('Do you have '), write(Symptom), write('? (yes/no)'),
    read(Response),
    Response = yes.

% Main predicate to start diagnosing
start_diagnosis :-
    write('Welcome to the medical diagnosis expert system.'), nl,
    write('Please answer the following questions with yes or no.'), nl,
    diagnose(Condition).
