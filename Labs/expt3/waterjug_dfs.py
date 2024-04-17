def water_jug_dfs(capacities, target):
    visited = set()
    stack = [(0, 0, [])]

    while stack:
        jug1, jug2, steps = stack.pop()
        if (jug1, jug2) in visited:
            continue
        visited.add((jug1, jug2))
        
        if jug1 == target or jug2 == target:
            return steps
        
        stack.append((capacities[0], jug2, steps + [(jug1, jug2, 'Fill jug1')]))
        stack.append((jug1, capacities[1], steps + [(jug1, jug2, 'Fill jug2')]))
        stack.append((0, jug2, steps + [(jug1, jug2, 'Empty jug1')]))
        stack.append((jug1, 0, steps + [(jug1, jug2, 'Empty jug2')]))
        
        pour_amount = min(jug1, capacities[1] - jug2)
        stack.append((jug1 - pour_amount, jug2 + pour_amount, steps + [(jug1, jug2, 'Pour from jug1 to jug2')]))
        
        pour_amount = min(jug2, capacities[0] - jug1)
        stack.append((jug1 + pour_amount, jug2 - pour_amount, steps + [(jug1, jug2, 'Pour from jug2 to jug1')]))

    return None

# Example usage:
capacities = (5, 3) 
target = 4
steps = water_jug_dfs(capacities, target)
if steps:
    for step in steps:
        print(step[0], step[1], step[2])
else:
    print("Target amount cannot be achieved.")
