(define (problem cops_robbers_graph7_707)
	(:domain cops_robbers)
	
	(:objects
		rob1 - robber
		cop1 - cop
		n0 n1 n2 n3 n4 n5 n6 n7 - location
	)
	
	(:init
		(edge n0 n1)
		
		(edge n0 n2)
		
		(edge n0 n3)
		
		(edge n0 n4)
		
		(edge n0 n5)
		
		(edge n0 n6)
		
		(edge n0 n7)
		
		
		(edge n1 n4)
		
		(edge n1 n5)
		
		(edge n1 n6)
		
		(edge n1 n7)
		
		
		(edge n2 n4)
		
		(edge n2 n5)
		
		(edge n2 n6)
		
		(edge n2 n7)
		
		
		(edge n3 n5)
		
		(edge n3 n6)
		
		(edge n3 n7)
		
		
		(edge n4 n1)
		
		(edge n4 n2)
		
		(edge n4 n6)
		
		(edge n4 n7)
		
		
		(edge n5 n1)
		
		(edge n5 n2)
		
		(edge n5 n3)
		
		(edge n5 n7)
		
		
		(edge n6 n1)
		
		(edge n6 n2)
		
		(edge n6 n3)
		
		(edge n6 n4)
		
		
		(edge n7 n1)
		
		(edge n7 n2)
		
		(edge n7 n3)
		
		(edge n7 n4)
		
		(edge n7 n5)
		
		
		(at rob1 n0)
		
		(at cop1 n0)
		(turn cop1)		

        )

        (:goal (and
            (done)
        ))
            
    )
        