(define (problem cops_robbers_fully_connected)
	(:domain cops_robbers)
	
	(:objects
		rob1 - robber
		cop1 - cop
		n1 n2 n3 n4 n5 n6 - location
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
		
		(num_connections n1 num5)
		
		(edge n2 n3)
		(edge n3 n2)
		
		(edge n2 n4)
		(edge n4 n2)
		
		(edge n2 n5)
		(edge n5 n2)
		
		(edge n2 n6)
		(edge n6 n2)
		
		(num_connections n2 num5)
		
		(edge n3 n4)
		(edge n4 n3)
		
		(edge n3 n5)
		(edge n5 n3)
		
		(edge n3 n6)
		(edge n6 n3)
		
		(num_connections n3 num5)
		
		(edge n4 n5)
		(edge n5 n4)
		
		(edge n4 n6)
		(edge n6 n4)
		
		(num_connections n4 num5)
		
		(edge n5 n6)
		(edge n6 n5)
		
		(num_connections n5 num5)
		
		(num_connections n6 num5)
		
		(at rob1 n1)
		
		(at cop1 n3)
		

    )

    (:goal (and
        (done)
    ))
        
)
    