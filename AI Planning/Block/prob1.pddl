(define (problem BLOCKS-4-0)
(:domain BLOCKS)
(:objects D B A C )
(:INIT 
(= (total-cost) 0)
(CLEAR C) (CLEAR A) (CLEAR B) (CLEAR D) (ONTABLE C) (ONTABLE A)
 (ONTABLE B) (ONTABLE D) (HANDEMPTY))
(:goal (AND (ON D C) (ON C B) (ON B A)))
(:metric minimize (total-cost))
)