
USEFUL COMMANDS
//open the environment
docker run -it --privileged -v ${PWD}:/root/cisc813 cjmuise/cisc813

//run the problem
prppp domains/domain_line_chase.pddl problems/problem_line_chase.pddl --output-format 3

//run friendly versions of the problem with no cycles
prppp domains/domain_line_chase.pddl problems/problem_line_chase.pddl --output-format 3 --localize-enabled 0

//visualize the policy
prpviz policy.out

The cops and robbers problem:

    The cops and robbers problem is a variation of a pursuit-evasion problem.
    Cops and robbers are entities that exist on a graph of nodes. 
    Taking turns, the cops and robbers may move to adjacent nodes. 
    The goal of the game for the cops is to corner the robber such that any move
    he makes would land him on a square shared by a cop. 
    A robber wins if he can avoid capture indefinitely. 
    In this scenario the cops would be moving non-deterministically,
    so the robber should have a plan for evasion no matter what move the cops make.


Domain.pddl
    The domain file is commented for clarity

Problems
    problem_maker.ipynb can be used to create new problems programatically
    Each problem has a different graph configuration and starting locations
    Problems with 2 cops can take a long time to run, I recommend one robber unless the graph is simple (like a straight line)
    If the robber has a solution a strong cyclic solution will be found
    For example, the robber can avoid capture indefinitly on a square
    If the robber is eventually caught, no strong cyclic solution will be found
    For example, the robber loses on a straight line
    Problem_line_chase.pddl is commented for clarity

Problem_solutions
    Problem solutions stores some of the graphs of the policies for future reference

    All robber nodes can lead to game terminate. This is done to allow the game to never definitivly end. All arcs to game terminate
    should be ignored when reading the graph

    star5 shows that the policy for the robber is to hide on one branch and pray
    square shows the robber wins if its always 2 sqares away from the cop
    line_chase shows that the robbers policy is to run to the end of the line and stay there
    tree shows the robber descends down the longest tree branch to hide

    The robber often moves back to known positions by following the cop if it goes in the opposite direction
    This makes it seem like the robber is taunting the cop

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
