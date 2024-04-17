% Define the Tower of Hanoi solving predicate
hanoi(N) :-
    move(N, left, right, middle).

% Base case: when there are no disks to move
move(0, _, _, _) :- !.

% Recursive case: move N disks from Start to End using Temp as the temporary peg
move(N, Start, End, Temp) :-
    M is N - 1,
    move(M, Start, Temp, End), % Move N-1 disks from Start to Temp
    write_move(N, Start, End), % Move the N-th disk from Start to End
    move(M, Temp, End, Start). % Move N-1 disks from Temp to End

% Helper predicate to write the move step
write_move(Disk, Start, End) :-
    format('Move disk ~w from ~w to ~w~n', [Disk, Start, End]).