(define (problem cops_robbers_tree_backtrack)
	(:domain cops_robbers)
	
	(:objects
		rob1 - robber
		cop1 - cop
		n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 - location
	)
	
	(:init
		(edge n1 n2)
		(edge n2 n1)
		
		(edge n1 n3)
		(edge n3 n1)
		
		(edge n1 n4)
		(edge n4 n1)
		
		(num_connections n1 num3)
		
		(edge n2 n10)
		(edge n10 n2)
		
		(num_connections n2 num2)
		
		(edge n3 n5)
		(edge n5 n3)
		
		(num_connections n3 num2)
		
		(edge n4 n13)
		(edge n13 n4)
		
		(num_connections n4 num2)
		
		(edge n5 n6)
		(edge n6 n5)
		
		(num_connections n5 num2)
		
		(edge n6 n7)
		(edge n7 n6)
		
		(num_connections n6 num2)
		
		(edge n7 n8)
		(edge n8 n7)
		
		(num_connections n7 num2)
		
		(edge n8 n9)
		(edge n9 n8)
		
		(num_connections n8 num2)
		
		(num_connections n9 num1)
		
		(edge n10 n11)
		(edge n11 n10)
		
		(num_connections n10 num2)
		
		(edge n11 n12)
		(edge n12 n11)
		
		(num_connections n11 num2)
		
		(num_connections n12 num1)
		
		(edge n13 n14)
		(edge n14 n13)
		
		(num_connections n13 num2)
		
		(num_connections n14 num1)
		
		(at rob1 n1)
		
		(at cop1 n3)
		

    )

    (:goal (and
        (done)
    ))
        
)
    