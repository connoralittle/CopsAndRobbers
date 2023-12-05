(define (problem cops_robbers_tree)
	(:domain cops_robbers)
	
	(:objects
		rob1 - robber
		cop1 - cop
		n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 - location
	)
	
	(:init
		(edge n0 n1)
		
		(edge n0 n2)
		
		(edge n0 n3)
		
		(edge n0 n4)
		
		(edge n0 n5)
		
		(edge n0 n6)
		
		(edge n0 n7)
		
		(edge n0 n8)
		
		(edge n0 n9)
		
		(edge n0 n10)
		
		
		(edge n1 n2)
		
		(edge n1 n5)
		
		(edge n1 n7)
		
		(edge n1 n8)
		
		
		(edge n2 n1)
		
		(edge n2 n3)
		
		
		(edge n3 n2)
		
		(edge n3 n4)
		
		
		(edge n4 n3)
		
		(edge n4 n9)
		
		
		(edge n5 n1)
		
		(edge n5 n6)
		
		
		(edge n6 n5)
		
		(edge n6 n10)
		
		
		(edge n7 n1)
		
		(edge n7 n11)
		
		
		(edge n8 n1)
		
		
		(edge n9 n4)
		
		
		(edge n10 n6)
		
		
		(edge n11 n7)
		
		
		(at rob1 n1)
		
		(at cop1 n8)
		(move0)		

        )

        (:goal (and
            (done)
        ))
            
    )
        