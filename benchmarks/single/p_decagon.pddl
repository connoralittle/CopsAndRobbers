(define (problem cops_robbers_decagon)
	(:domain cops_robbers)
	
	(:objects
		rob1 - robber
		cop1 - cop
		n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - location
	)
	
	(:init
		
		(edge n1 n2)
		
		(edge n1 n10)
		
		
		(edge n2 n3)
		
		(edge n2 n1)
		
		
		(edge n3 n4)
		
		(edge n3 n2)
		
		
		(edge n4 n3)
		
		(edge n4 n5)
		
		
		(edge n5 n4)
		
		(edge n5 n6)
		
		
		(edge n6 n5)
		
		(edge n6 n7)
		
		
		(edge n7 n6)
		
		(edge n7 n8)
		
		
		(edge n8 n7)
		
		(edge n8 n9)
		
		
		(edge n9 n8)
		
		(edge n9 n10)
		
		
		(edge n10 n9)
		
		(edge n10 n1)
		
		
		(at rob1 n1)
		
		(at cop1 n5)
		(turn cop1)		

        )

        (:goal (and
            (done)
        ))
            
    )
        