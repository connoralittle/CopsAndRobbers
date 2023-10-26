(define (problem cops_robbers_star)
	(:domain cops_robbers)
	
	(:objects
		rob1 - robber
		cop1 - cop
		n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 - location
	)
	
	(:init
		(edge n1 n2)
		(edge n2 n1)
		
		(edge n1 n3)
		(edge n3 n1)
		
		(edge n1 n4)
		(edge n4 n1)
		
		(edge n1 n5)
		(edge n5 n1)
		
		(edge n1 n6)
		(edge n6 n1)
		
		(edge n1 n7)
		(edge n7 n1)
		
		(edge n1 n8)
		(edge n8 n1)
		
		(edge n1 n9)
		(edge n9 n1)
		
		(edge n1 n10)
		(edge n10 n1)
		
		(edge n1 n11)
		(edge n11 n1)
		
		(edge n1 n12)
		(edge n12 n1)
		
		(num_connections n1 num11)
		
		(num_connections n2 num1)
		
		(num_connections n3 num1)
		
		(num_connections n4 num1)
		
		(num_connections n5 num1)
		
		(num_connections n6 num1)
		
		(num_connections n7 num1)
		
		(num_connections n8 num1)
		
		(num_connections n9 num1)
		
		(num_connections n10 num1)
		
		(num_connections n11 num1)
		
		(num_connections n12 num1)
		
		(at rob1 n1)
		
		(at cop1 n3)
		

    )

    (:goal (and
        (done)
    ))
        
)
    