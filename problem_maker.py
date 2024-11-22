import functools

def write_problem(directory, name,
                rob_objects,
                cop_objects,
                node_objects,
                nodes,
                robbers,
                cops,
                edges,
                counts,
                friendly=False,
                rob_start=False):
    with open(f"{directory}p_{name}.pddl", "w") as file1:
        file1.write(f"(define (problem cops_robbers_{name})\n")
        file1.write('\t(:domain cops_robbers)\n')
        file1.write("\t\n")
        file1.write("\t(:objects\n")
        file1.write(f"\t\t{rob_objects}- robber\n")
        file1.write(f"\t\t{cop_objects}- cop\n")
        file1.write(f"\t\t{node_objects}- location\n")
        file1.write("\t)\n")
        file1.write("\t\n")
        file1.write("\t(:init\n")
        for i in range(len(nodes)):
            if i != 0:
                edges.append((nodes[i][0], nodes[i][0]))
                file1.write(f"\t\t(edge n{nodes[i][0]} n{nodes[i][0]})\n\n")
            for j in range(len(nodes[i][1])):
                edges.append((nodes[i][0], nodes[i][1][j]))
                file1.write(f"\t\t(edge n{nodes[i][0]} n{nodes[i][1][j]})\n")
                file1.write(f"\t\t\n")
                counts[nodes[i][0]] += 1
            file1.write(f"\t\t\n")
        for i in range(len(robbers)):
            file1.write(f"\t\t(at rob{i + 1} {robbers[i]})\n")
        file1.write(f"\t\t\n")
        for i in range(len(cops)):
            file1.write(f"\t\t(at cop{i + 1} {cops[i]})\n")
            if (not rob_start):
                file1.write(f"\t\t(turn cop{i + 1})\n")
        file1.write(f"\t\t\n")
        if friendly:
            file1.write(f"\t\t(friendly)\n")
        file1.write("""
        )

        (:goal (and
            (done)
        ))
            
    )
        """)
    # print("problem created")

    return edges, counts

def write_domain(directory, name,
                nodes,
                edges,
                counts,
                moves):   
    with open(f"{directory}d_{name}.pddl", "w") as file1:
        file1.write(f"""(define (domain cops_robbers)

    (:requirements
        :adl
        :negative-preconditions
        :non-deterministic)

        (:types
            location entity number - object
            node - location
            cop robber - entity
        )
        
        (:predicates
            ;Designates an entity occupies a node
            (at ?p - entity ?x - location)
            ;Designates which nodes are connected
            (edge ?x ?y - location)
            ;Designates which cop has to move
            (turn ?x - cop)
            
            ;caught is true if the robber occupies the same square as a cop
            (caught)
            ;designates if the robber wants to be caught
            (friendly)
            ;survived is true if the robber survives. It acts as a flag for the game to end
            (survived)
            ;done is a flag to end the game if the robber is not caught and has survived
            (done)
            ;nil does nothing. used to make oneofs do nothing
            (nil) """)
        
        file1.write(f"""
        )\n\n""")

        file1.write("""\t;The robber makes a move
        (:action robber_move
            ;given 2 locations
            :parameters (?x ?y - location)

            :precondition (and
                ;if the robber is at the first location
                (at rob1 ?x)
                ;the second location is reachable
                (edge ?x ?y)
                ;and there are no cops which can make moves
                (forall (?c - cop) (not (turn ?c)))
            )
                    
            :effect (and
                ;check if the new location moves the robber onto a cop
                (when (exists (?c - cop) (at ?c ?y)) (caught))
                ;remove the robber from the first node
                (not (at rob1 ?x))
                ;place him at the second node
                (at rob1 ?y)
                    
                (forall (?c - cop)  
                    (turn ?c)
                )

                ;non deterministically end the game or do nothing
                (oneof
                    (survived)
                    (nil)
                )
            )
        )
        
        """)


        for node in [x[0] for x in nodes]:
            if counts[node] == 0:
                continue
            file1.write(f"""\t;A cop move at node {node}
        (:action cop_move{node}
            ;given a cop and a node
            :parameters (?c - cop)

            :precondition (and
                ;if it is the cops turn
                (turn ?c)
                ;the cop is at the node
                (at ?c n{node})
            )
            
            ;move the cop to a non deterministic an adjacent node
            :effect (and
                ;the cop no longer has a turn
                (not (turn ?c))
                
                ;the cop is not at the first node
                (not (at ?c n{node}))\n""")

            if counts[node] == 1:
                file1.write("""
                ;the cop moves to the edge""")
                for left, right in edges:
                    if node == left:
                        file1.write(f"""
                (and 
                    (at ?c n{right})
                    (when (at rob1 n{right}) (caught))
                )\n""")
                file1.write("""
            )   
        )\n\n""")

            else:

                file1.write("""
                ;the cop non deterministically moves between one of the edges
                (oneof\n""")

                for left, right in edges:
                    if node == left:
                        file1.write(f"""
                    (and 
                        (at ?c n{right})
                        (when (at rob1 n{right}) (caught))
                    )\n""")
                    
                file1.write("""            )
            )   
        )\n\n""")

        file1.write("""
        ;when the cops catch the robbers, end the game
        (:action game_terminate
            :parameters ()
            ;check if survived and not caught
            ;not caught incentivies the robber to survive as long as possible
            ;surivived ensures the game can run indefinitly
            ;combined the robber will try to survive indefinitly
            ;We don't want a definitive way to end the game because we want a plan for the whole system,
            ;not just a way to end the game
            :precondition (and
                ;You don't want friendly robbers to stall for a chance at winning
                (not (friendly))
                (survived)
                (not (caught))
            )
            ;when satisfied end the game
            :effect (and
                (done)            
            )
        )        
                    
        ;Friendly variation of the game
        ;The game ends if the robber is caught
        ;The robber has no incentive to run
        ;The planner wants to end the game
        (:action game_terminate
            :parameters ()
            :precondition (and
                ;If friendly
                (friendly)
                ;And caught
                (caught)
            )
            ;end the game
            :effect (and
                (done)   
            )
        )
    )""")

    # print("domain created")

def write_catalogue(count, name):
    with open(f"benchmarks/catalogue.py", "w") as file1:
        file1.write("""import os\n\n""")
        
        file1.write("""graphs = [\n""")

        for i in range(count):
            file1.write(f"('d_{name}_{i}.pddl', 'p_{name}_{i}.pddl',),\n")
        file1.write("""]\n""")
        
        file1.write("""DOMAINS = {
                '""" + name + """': graphs,
            }\n""")
        file1.write("""COLLECTIONS = {
                'collection': ['""" + name + """',]
            }\n""")


        file1.write("""    # Path to the directory containing this script
SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))

for dom in DOMAINS:
    # Replace all the files with their absolute path
    DOMAINS[dom] = [
        (os.path.abspath(os.path.join(SCRIPT_DIR, dom, dom_file)), os.path.abspath(os.path.join(SCRIPT_DIR, dom, prob_file))) for dom_file, prob_file in DOMAINS[dom]
    ]

def confirm_files():
    for d in DOMAINS:
        print('(%3d) %s' % (len(DOMAINS[d]), d))
        for domain, problem in DOMAINS[d]:
            assert os.path.exists(domain), f'{domain} does not exist'
            assert os.path.exists(problem), f'{problem} does not exist'""")

import os
import argparse

parser = argparse.ArgumentParser()

parser.add_argument('-c', "--count")    
parser.add_argument('-v', "--vertices") 
parser.add_argument('-n', "--name") 

args = parser.parse_args()

# count = 2162
# count = 853
count = int(args.count)
num_vertices = int(args.vertices)
nodes_read = [[] for _ in range(num_vertices)]
name = args.name
directory = f"benchmarks/{name}/"


robbers = ["n0"]
cops = ["n0"]
friendly = False
moves = 1

try:
    os.mkdir(directory)
except:
    print("directory already made.")
try:
    os.mkdir(f"benchmarks/RESULTS/{name}")
except:
    print("directory already made.")

with open(f"graph_libraries/{name}.txt", "r", encoding='utf-16') as file1:
    file1.readline()
    for i in range(count):
        file1.readline()
        
        for j in range(num_vertices):
            x = file1.readline().strip()
            nodes_read[j] = list(filter(lambda x: x != 0, [idx + 1 if x == '1' else 0 for idx, x in enumerate(list(x))]))
        file1.readline()

        nodes = [
            (0, range(1, num_vertices + 1)),
        ]
        for j in range(num_vertices):
            nodes.append((j + 1, nodes_read[j]))

        counts = [0] * len(nodes)
        rob_objects = functools.reduce(lambda a, b: a + b, ["rob" + str(i + 1) + " " for i in range(len(robbers))])
        cop_objects = functools.reduce(lambda a, b: a + b, ["cop" + str(i + 1) + " " for i in range(len(cops))])
        node_objects = functools.reduce(lambda a, b: a + b, ["n" + str(i) + " " for i in range(len(nodes))])
        edges = []

        edges, counts = write_problem(directory, name + f"_{i}",
                rob_objects,
                cop_objects,
                node_objects,
                nodes,
                robbers,
                cops,
                edges,
                counts,
                friendly)
        
        write_domain(directory, name + f"_{i}", nodes, edges, counts, moves)

    write_catalogue(count, name)
        
print("complete")