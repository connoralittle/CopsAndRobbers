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
            (nil) 
            ;counts the number of moves a robber may make
            (move0)
        )

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
                
                ;increment the number of moves a robber has made
                ;if all moves have been made, it is the cops turn
                (when (move0) (and (not (move0))
                    (forall (?c - cop)  
                        (turn ?c)
                    )))

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

                ;the robber can't hide on the intial node
                (not (at rob1 n0))

                ;and no cops want to make a move
                (forall (?c - cop) (not (turn ?c)))
            )
            :effect (and
                ;check if a cop is at the same locaiton
                (when (exists (?c - cop) (at ?c ?y)) (caught))
                ;increment the number of moves a robber has made
                ;if all moves have been made, it is the cops turn
                (when (move0) (and (not (move0))
                    (forall (?c - cop)  
                        (turn ?c)
                    )))

                ;non deterministically end the game or do nothing
                (oneof
                    (survived)
                    (nil)
                )
            )
        )      
        

	;A cop move at node 0
        (:action cop_move0
            ;given a cop and a node
            :parameters (?c - cop)

            :precondition (and
                ;if it is the cops turn
                (turn ?c)
                ;the cop is at the node
                (at ?c n0)
            )
            
            ;move the cop to a non deterministic an adjacent node
            :effect (and
                ;the cop no longer has a turn
                (not (turn ?c))
                
                ;reset robber moves
                (move0)
                
                ;the cop is not at the first node
                (not (at ?c n0))

                ;the cop non deterministically moves between one of the edges
                (oneof

                    (and 
                        (at ?c n1)
                        (when (at rob1 n1) (caught))
                    )

                    (and 
                        (at ?c n2)
                        (when (at rob1 n2) (caught))
                    )

                    (and 
                        (at ?c n3)
                        (when (at rob1 n3) (caught))
                    )

                    (and 
                        (at ?c n4)
                        (when (at rob1 n4) (caught))
                    )

                    (and 
                        (at ?c n5)
                        (when (at rob1 n5) (caught))
                    )

                    (and 
                        (at ?c n6)
                        (when (at rob1 n6) (caught))
                    )

                    (and 
                        (at ?c n7)
                        (when (at rob1 n7) (caught))
                    )
            )
            )   
        )

	;A cop move at node 1
        (:action cop_move1
            ;given a cop and a node
            :parameters (?c - cop)

            :precondition (and
                ;if it is the cops turn
                (turn ?c)
                ;the cop is at the node
                (at ?c n1)
            )
            
            ;move the cop to a non deterministic an adjacent node
            :effect (and
                ;the cop no longer has a turn
                (not (turn ?c))
                
                ;reset robber moves
                (move0)
                
                ;the cop is not at the first node
                (not (at ?c n1))

                ;the cop non deterministically moves between one of the edges
                (oneof

                    (and 
                        (at ?c n5)
                        (when (at rob1 n5) (caught))
                    )

                    (and 
                        (at ?c n6)
                        (when (at rob1 n6) (caught))
                    )

                    (and 
                        (at ?c n7)
                        (when (at rob1 n7) (caught))
                    )
            )
            )   
        )

	;A cop move at node 2
        (:action cop_move2
            ;given a cop and a node
            :parameters (?c - cop)

            :precondition (and
                ;if it is the cops turn
                (turn ?c)
                ;the cop is at the node
                (at ?c n2)
            )
            
            ;move the cop to a non deterministic an adjacent node
            :effect (and
                ;the cop no longer has a turn
                (not (turn ?c))
                
                ;reset robber moves
                (move0)
                
                ;the cop is not at the first node
                (not (at ?c n2))

                ;the cop non deterministically moves between one of the edges
                (oneof

                    (and 
                        (at ?c n5)
                        (when (at rob1 n5) (caught))
                    )

                    (and 
                        (at ?c n6)
                        (when (at rob1 n6) (caught))
                    )

                    (and 
                        (at ?c n7)
                        (when (at rob1 n7) (caught))
                    )
            )
            )   
        )

	;A cop move at node 3
        (:action cop_move3
            ;given a cop and a node
            :parameters (?c - cop)

            :precondition (and
                ;if it is the cops turn
                (turn ?c)
                ;the cop is at the node
                (at ?c n3)
            )
            
            ;move the cop to a non deterministic an adjacent node
            :effect (and
                ;the cop no longer has a turn
                (not (turn ?c))
                
                ;reset robber moves
                (move0)
                
                ;the cop is not at the first node
                (not (at ?c n3))

                ;the cop non deterministically moves between one of the edges
                (oneof

                    (and 
                        (at ?c n5)
                        (when (at rob1 n5) (caught))
                    )

                    (and 
                        (at ?c n6)
                        (when (at rob1 n6) (caught))
                    )

                    (and 
                        (at ?c n7)
                        (when (at rob1 n7) (caught))
                    )
            )
            )   
        )

	;A cop move at node 4
        (:action cop_move4
            ;given a cop and a node
            :parameters (?c - cop)

            :precondition (and
                ;if it is the cops turn
                (turn ?c)
                ;the cop is at the node
                (at ?c n4)
            )
            
            ;move the cop to a non deterministic an adjacent node
            :effect (and
                ;the cop no longer has a turn
                (not (turn ?c))
                
                ;reset robber moves
                (move0)
                
                ;the cop is not at the first node
                (not (at ?c n4))

                ;the cop moves to the edge
                (and 
                    (at ?c n6)
                    (when (at rob1 n6) (caught))
                )

            )   
        )

	;A cop move at node 5
        (:action cop_move5
            ;given a cop and a node
            :parameters (?c - cop)

            :precondition (and
                ;if it is the cops turn
                (turn ?c)
                ;the cop is at the node
                (at ?c n5)
            )
            
            ;move the cop to a non deterministic an adjacent node
            :effect (and
                ;the cop no longer has a turn
                (not (turn ?c))
                
                ;reset robber moves
                (move0)
                
                ;the cop is not at the first node
                (not (at ?c n5))

                ;the cop non deterministically moves between one of the edges
                (oneof

                    (and 
                        (at ?c n1)
                        (when (at rob1 n1) (caught))
                    )

                    (and 
                        (at ?c n2)
                        (when (at rob1 n2) (caught))
                    )

                    (and 
                        (at ?c n3)
                        (when (at rob1 n3) (caught))
                    )

                    (and 
                        (at ?c n7)
                        (when (at rob1 n7) (caught))
                    )
            )
            )   
        )

	;A cop move at node 6
        (:action cop_move6
            ;given a cop and a node
            :parameters (?c - cop)

            :precondition (and
                ;if it is the cops turn
                (turn ?c)
                ;the cop is at the node
                (at ?c n6)
            )
            
            ;move the cop to a non deterministic an adjacent node
            :effect (and
                ;the cop no longer has a turn
                (not (turn ?c))
                
                ;reset robber moves
                (move0)
                
                ;the cop is not at the first node
                (not (at ?c n6))

                ;the cop non deterministically moves between one of the edges
                (oneof

                    (and 
                        (at ?c n1)
                        (when (at rob1 n1) (caught))
                    )

                    (and 
                        (at ?c n2)
                        (when (at rob1 n2) (caught))
                    )

                    (and 
                        (at ?c n3)
                        (when (at rob1 n3) (caught))
                    )

                    (and 
                        (at ?c n4)
                        (when (at rob1 n4) (caught))
                    )
            )
            )   
        )

	;A cop move at node 7
        (:action cop_move7
            ;given a cop and a node
            :parameters (?c - cop)

            :precondition (and
                ;if it is the cops turn
                (turn ?c)
                ;the cop is at the node
                (at ?c n7)
            )
            
            ;move the cop to a non deterministic an adjacent node
            :effect (and
                ;the cop no longer has a turn
                (not (turn ?c))
                
                ;reset robber moves
                (move0)
                
                ;the cop is not at the first node
                (not (at ?c n7))

                ;the cop non deterministically moves between one of the edges
                (oneof

                    (and 
                        (at ?c n1)
                        (when (at rob1 n1) (caught))
                    )

                    (and 
                        (at ?c n2)
                        (when (at rob1 n2) (caught))
                    )

                    (and 
                        (at ?c n3)
                        (when (at rob1 n3) (caught))
                    )

                    (and 
                        (at ?c n5)
                        (when (at rob1 n5) (caught))
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