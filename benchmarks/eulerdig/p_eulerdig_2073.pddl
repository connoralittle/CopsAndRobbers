(define (problem cops_robbers_eulerdig_2073)
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
		
		
		
		
		
		
		
		
		
		(at rob1 n0)
		
		(at cop1 n0)
		(turn cop1)		

        )

        (:goal (and
            (done)
        ))
            
    )
        