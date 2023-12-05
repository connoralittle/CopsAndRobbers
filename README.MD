
The cops and robbers problem:

    The cops and robbers problem is a variation of a pursuit-evasion problem.
    Cops and robbers are entities that exist on a graph of nodes. 
    Taking turns, the cops and robbers may move to adjacent nodes. 
    The goal of the game for the cops is to corner the robber such that any move
    he makes would land him on a square shared by a cop. 
    A robber wins if he can avoid capture indefinitely. 
    In this scenario the cops would be moving non-deterministically,
    so the robber should have a plan for evasion no matter what move the cops make.

Friendly robbers

    An extra variation is the friendly robber
    This robber wants to get captured which reverses the problem
    Instead of trying to avoid all possible capture paths
    You are trying to capture a randomly moving entity
    The problem solution also reverses
    The game ends if the robber is captured. To incentivise speed, the game randomly assigns the robber survived
    If the robber survives the robber loses
    Instead of most nodes leading to game terminated and a -1 meaning the robber loses
    Most games end in -1 and a game terminated means the cop loses
    No solutions can exist as all nodes have a chance to fail
    Line_opposite_friendly.png shows a solution of the robber trying to get caught

Domain_generic.pddl

    The domain file is commented for clarity. It is a problem-agnostic version of the domain with bounded size.
    It is also much slower

Domains

    problem_maker.ipynb can be used to create new domains programmatically
    domains hard-code cop move actions to reduce state space

Problems

    problem_maker.ipynb can be used to create new problems programmatically
    Each problem has a different graph configuration and starting locations
    Problems with 2 cops can take a long time to run, I recommend one robber unless the graph is simple (like a straight line)
    If the robber has a solution a strong cyclic solution will be found
    For example, the robber can avoid capture indefinitely on a square
    If the robber is eventually caught, no strong cyclic solution will be found
    For example, the robber loses on a straight line
    Problem_line_chase.pddl is commented for clarity

graph_libraries

    contains the data for generating graphs. the text files have adjacency graphs and the other files have 
    the compressed data that can be extracted with showg

HOW TO RUN

    Place project in directory of planner

    launch docker
        docker run -it -v ${pwd}:/PROJECT rbp

    example of generating benchmark
        python rbp/prp-scripts/evaluate.py --catalogue /PROJECT/cops_and_robbers/benchmark --collection collection_test --output /PROJECT/cops_and_robbers/benchmark/RESULTS --cache CACHE --planner rbp 

    go to the benchmark and run
        cd cache 
        time python run.py

    example of running individual instances
        rbp cops_and_robbers/benchmarks/single/d_decagon.pddl cops_and_robbers/benchmarks/single/p_decagon.pddl 
        rbp cops_and_robbers/benchmarks/graph7/d_graph7_441.pddl cops_and_robbers/benchmarks/graph_7/p_graph7_441.pddl --output-format 3

    visualize the output
        prpviz policy.out

Planner not provided
Not all domain and problem files pushed due to space
