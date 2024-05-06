from collections import deque

# Function to check if the puzzle is solved
def is_goal(state):
    goal_state = [[1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 0]]
    return state == goal_state

# Function to find the possible moves
def possible_moves(state):
    moves = []
    for i in range(3):
        for j in range(3):
            if state[i][j] == 0:
                if i > 0:
                    moves.append((i, j, i - 1, j))
                if i < 2:
                    moves.append((i, j, i + 1, j))
                if j > 0:
                    moves.append((i, j, i, j - 1))
                if j < 2:
                    moves.append((i, j, i, j + 1))
    return moves

# Function to apply a move to the state
def apply_move(state, move):
    new_state = [row[:] for row in state]
    i, j, new_i, new_j = move
    new_state[i][j], new_state[new_i][new_j] = new_state[new_i][new_j], new_state[i][j]
    return new_state

# Function for iterative deepening depth-first search
def iddfs(start_state):
    depth = 0
    while True:
        result = depth_limited_dfs(start_state, depth)
        if result is not None:
            return result, depth
        depth += 1

# Function for depth-limited DFS
def depth_limited_dfs(state, depth_limit):
    stack = deque([(state, [])])
    while stack:
        current_state, path = stack.pop()
        if is_goal(current_state):
            return path
        if len(path) < depth_limit:
            for move in possible_moves(current_state):
                new_state = apply_move(current_state, move)
                stack.append((new_state, path + [move]))
    return None

# Function to print the puzzle state
def print_puzzle(state):
    for row in state:
        print(row)

# Example usage
if __name__ == "__main__":
    initial_state = [[1, 2, 3],
                     [0, 4, 6],
                     [7, 5, 8]]
    print("Start State:")
    print_puzzle(initial_state)
    print("\nSolving...")
    solution, cost = iddfs(initial_state)
    if solution:
        print("\nFound solution with cost", cost)
        step = 1
        current_state = initial_state
        for move in solution:
            print("\nStep {}:".format(step))
            step += 1
            current_state = apply_move(current_state, move)
            print_puzzle(current_state)
    else:
        print("No solution found.")