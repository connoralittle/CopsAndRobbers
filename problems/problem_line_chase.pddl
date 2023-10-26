(define (problem cops_robbers_line_chase)
	(:domain cops_robbers)
	
	(:objects
		rob1 - robber
		cop1 - cop
		n1 n2 n3 n4 n5 n6 - location
	)
	
	(:init
		(edge n1 n2)
		(edge n2 n1)
		
		(num_connections n1 num1)
		
		(edge n2 n3)
		(edge n3 n2)
		
		(num_connections n2 num2)
		
		(edge n3 n4)
		(edge n4 n3)
		
		(num_connections n3 num2)
		
		(edge n4 n5)
		(edge n5 n4)
		
		(num_connections n4 num2)
		
		(edge n5 n6)
		(edge n6 n5)
		
		(num_connections n5 num2)
		
		(num_connections n6 num1)
		
		(at rob1 n6)
		
		(at cop1 n1)
		
		(friendly)

    )

    (:goal (and
        (done)
    ))
        
)
    