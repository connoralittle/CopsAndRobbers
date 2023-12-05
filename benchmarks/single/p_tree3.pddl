(define (problem cops_robbers_tree3)
	(:domain cops_robbers)
	
	(:objects
		rob1 - robber
		cop1 - cop
		n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 - location
	)
	
	(:init
		
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
		
		(edge n8 n12)
		
		
		(edge n9 n4)
		
		
		(edge n10 n6)
		
		
		(edge n11 n7)
		
		
		(edge n12 n8)
		
		(edge n12 n13)
		
		
		(edge n13 n12)
		
		(edge n13 n14)
		
		
		(edge n14 n13)
		
		(edge n14 n15)
		
		
		(edge n15 n14)
		
		(edge n15 n16)
		
		(edge n15 n18)
		
		
		(edge n16 n15)
		
		(edge n16 n17)
		
		
		(edge n17 n16)
		
		(edge n17 n18)
		
		
		(edge n18 n15)
		
		(edge n18 n17)
		
		
		(at rob1 n1)
		
		(at cop1 n8)
		(move0)		

        )

        (:goal (and
            (done)
        ))
            
    )
        