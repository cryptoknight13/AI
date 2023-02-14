(define (problem boarding)
(:domain travel)
(:objects
   p1
   h1
   t1
   a1
   ST
   g1
   f1
   b1
   bt
)
(:init
   (person p1)
   (home h1)
   (bus b1)
   (taxi t1)
   (bus-terminal bt)
   (airport a1)
   (security ST)
   (gate g1)
   (flight f1)
   (at p1 h1)
   (= (total-cost) 0)
)
(:goal
      (in p1 f1)
)
(:metric minimize (total-cost))
)