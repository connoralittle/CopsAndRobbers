(define (problem cops_robbers_square)
	(:domain cops_robbers)
	
	(:objects
		rob1 - robber
		cop1 - cop
		n0 n1 n2 n3 n4 - location
	)
	
	(:init
		
		(edge n1 n2)
		
		(edge n1 n4)
		
		
		(edge n2 n3)
		
		(edge n2 n1)
		
		
		(edge n3 n4)
		
		(edge n3 n2)
		
		
		(edge n4 n3)
		
		(edge n4 n1)
		
		
		(at rob1 n3)
		
		(at cop1 n1)
		(move0)		

        )

        (:goal (and
            (done)
        ))
            
    )
        