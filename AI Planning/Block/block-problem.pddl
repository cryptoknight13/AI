(define (problem solve-block)
   (:domain blocks)
   (:objects D C A B - block)
   (:init
        (clear A)
        (clear C)
        (on C D)
        (on A B)
        (ontable B)
        (ontable D)
        (handempty)
   )
   (:goal
        (AND (on D C) (on C B) (on B A))
   )
)