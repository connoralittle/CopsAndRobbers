(define (domain cops_robbers)

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
        ;Designates how many edges a node has
        (num_connections ?x - location ?N - number)
        ;Designates which cop has to move
        (turn ?x - cop)

        ;allow the robber to want capture. This reverses the problem
        ;Instead of trying to avoid all possible paths of capture for as long as possible
        ;It becomes how to corner a randomly moving entity
        (friendly)
        
        ;caught is true if the robber occupies the same square as a cop
        (caught)
        ;survived is true if the robber survives. It acts as a flag for the game to end
        (survived)
        ;done is a flag to end the game if the robber is not caught and has survived
        (done)
        ;nil does nothing. used to make oneofs do nothing
        (nil) 
    )

    ;numerical constants
    (:constants num1 num2 num3 num4 num5 num6 num7 num8 num9 num10 - number)

    ;The robber makes a move
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
            ;make it the cops turn
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

    ;The robber stays in place
    (:action robber_stay
        ;given a location
        :parameters (?x - location)
        :precondition (and
            ;if the robber is at that location
            (at rob1 ?x)
            ;and no cops want to make a move
            (forall (?c - cop) (not (turn ?c)))
        )
        :effect (and
            ;check if a cop is at the same locaiton
            (when (exists (?c - cop) (at ?c ?y)) (caught))

            ;make it the cops turn
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

    ;All cop moves are structurally similar, just different scales

    ;A node with one move is deterministic by default
    (:action cop_move_1opt
        ;given a cop and 2 locations
        :parameters (?c - cop ?x ?y - location)

        :precondition (and
            ;if its the cops turn
            (turn ?c)
            ;the node the cops is at has one connection
            (num_connections ?x num1)
            ;the cop is at the node
            (at ?c ?x)
            ;there is a connection from node x to y
            (edge ?x ?y)
        )

        :effect (and
            ;it is no longer the cops turn
            (not (turn ?c))
            ;the cop is no longer at the first node
            (not (at ?c ?x))
            (and 
                ;place the cop at the second node
                (at ?c ?y)
                ;if the cop is on the same space as the robber it is caught
                (when (at rob1 ?y) (caught))
            )
        )   
    )

    ;cops should move non-deterministically
    (:action cop_move_2opt
        ;given a cop and 3 location
        :parameters (?c - cop ?x ?y ?z - location)

        :precondition (and
            ;if it is the cops turn
            (turn ?c)
            ;the first node has 2 connections
            (num_connections ?x num2)
            ;the cop is at the first node
            (at ?c ?x)
            ;there are connections from x to y and x to z
            (edge ?x ?y)
            (edge ?x ?z)
            ;and the extra nodes are not the same
            ;(the edge predicate excludes x from needing this comparison)
            (not (= ?y ?z))
        )
        
        ;move the cop to a non deterministic nearby location
        :effect (and
            ;the cop no longer has a turn
            (not (turn ?c))
            ;the cop is not at the first node
            (not (at ?c ?x))
            ;the cop non deterministically moves between one of the edges
            (oneof 
                (and 
                    (at ?c ?y)
                    (when (at rob1 ?y) (caught))
                )
                (and 
                    (at ?c ?z)
                    (when (at rob1 ?z) (caught))
                )
            )
        )   
    )

    (:action cop_move_3opt
        ;The number of parameters grows linearly
        :parameters (?c - cop ?x ?y ?z ?w - location)
        :precondition (and
            (turn ?c)
            (num_connections ?x num3)
            (at ?c ?x)
            (edge ?x ?y)
            (edge ?x ?z)
            (edge ?x ?w)
            ;the number of comparisons grows according to the triangle numbers (quadratically)
            (not (= ?y ?z))
            (not (= ?y ?w))
            (not (= ?z ?w))
            
        )
        :effect (and
            (not (turn ?c))
            (not (at ?c ?x))
            ;the number of choices grows linearly
            (oneof 
                (and 
                    (at ?c ?y)
                    (when (at rob1 ?y) (caught))
                )
                (and 
                    (at ?c ?z)
                    (when (at rob1 ?z) (caught))
                )
                (and 
                    (at ?c ?w)
                    (when (at rob1 ?w) (caught))
                )
            )
        )   
    )

    (:action cop_move_4opt
        :parameters (?c - cop ?x ?y ?z ?w ?v - location)
        :precondition (and
            (turn ?c)
            (num_connections ?x num4)
            (at ?c ?x)

            (edge ?x ?y)
            (edge ?x ?z)
            (edge ?x ?w)
            (edge ?x ?v)

            (not (= ?y ?z))
            (not (= ?y ?w))
            (not (= ?y ?v))
            (not (= ?z ?w))
            (not (= ?z ?v))
            (not (= ?w ?v))
        )
        :effect (and
            (not (turn ?c))
            (not (at ?c ?x))
            (oneof 
                (and 
                    (at ?c ?y)
                    (when (at rob1 ?y) (caught))
                )
                (and 
                    (at ?c ?z)
                    (when (at rob1 ?z) (caught))
                )
                (and 
                    (at ?c ?w)
                    (when (at rob1 ?w) (caught))
                )
                (and 
                    (at ?c ?v)
                    (when (at rob1 ?v) (caught))
                )
            )
        )   
    )

    (:action cop_move_5opt
        :parameters (?c - cop ?x ?y ?z ?w ?v ?u - location)
        :precondition (and
            (turn ?c)
            (num_connections ?x num5)
            (at ?c ?x)

            (edge ?x ?y)
            (edge ?x ?z)
            (edge ?x ?w)
            (edge ?x ?v)
            (edge ?x ?u)

            (not (= ?y ?z))
            (not (= ?y ?w))
            (not (= ?y ?v))
            (not (= ?y ?u))
            (not (= ?z ?w))
            (not (= ?z ?v))
            (not (= ?z ?u))
            (not (= ?w ?v))
            (not (= ?w ?u))
            (not (= ?v ?u))

        )
        :effect (and
            (not (turn ?c))
            (not (at ?c ?x))
            (oneof 
                (and 
                    (at ?c ?y)
                    (when (at rob1 ?y) (caught))
                )
                (and 
                    (at ?c ?z)
                    (when (at rob1 ?z) (caught))
                )
                (and 
                    (at ?c ?w)
                    (when (at rob1 ?w) (caught))
                )
                (and 
                    (at ?c ?v)
                    (when (at rob1 ?v) (caught))
                )
                (and 
                    (at ?c ?u)
                    (when (at rob1 ?u) (caught))
                )
            )
        )   
    )

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
            ;not survived incentiveses quick ends
            (not (survived))
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
)