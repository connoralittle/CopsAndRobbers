(define (problem cops_robbers_eulerdig_364)
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
		
		
		(edge n1 n3)
		
		(edge n1 n6)
		
		
		(edge n2 n1)
		
		(edge n2 n2)
		
		(edge n2 n4)
		
		
		
		(edge n4 n8)
		
		(edge n4 n9)
		
		
		(edge n5 n4)
		
		(edge n5 n5)
		
		
		(edge n6 n5)
		
		(edge n6 n6)
		
		
		(edge n7 n6)
		
		
		(at rob1 n0)
		
		(at cop1 n0)
		(turn cop1)		

        )

        (:goal (and
            (done)
        ))
            
    )
        