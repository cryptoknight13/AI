(define (domain travel)
(:predicates
      (person ?p)
      (home ?h)
      (taxi ?t)
      (airport ?a)
      (bus ?b)
      (bus-terminal ?bt)
      (security ?sc)
      (gate ?g)
      (flight ?f)
      (at ?x ?y)
      (in ?x ?y)
      (verrify ?p)
 )
 (:functions (total-cost))
 
 (:action transporttaxi
  :parameters (?h ?p ?t)
  :precondition (AND (person ?p) (home ?h) (taxi ?t) (at ?p ?h))
  :effect (AND (in ?p ?t) (not (at ?p ?h)) (increase (total-cost) 1))
)
(:action transportbus
  :parameters (?h ?p ?b ?bt)
  :precondition (AND (person ?p) (home ?h) (bus ?b) (at ?p ?h))
  :effect (AND (in ?p ?b) (not (at ?p ?h)) (increase (total-cost) 1))
)
 (:action arrivebytaxi
  :parameters (?p ?t ?a)
  :precondition (and (person ?p) (taxi ?t) (airport ?a) (in ?p ?t))
  :effect (AND (at ?p ?a) (not (in ?p ?t)) (increase (total-cost) 1))
 )
 (:action arrivebusterminal
  :parameters (?p ?bt ?b)
  :precondition (and (person ?p) (bus ?b) (bus-terminal ?bt) (in ?p ?b))
  :effect (AND (at ?p ?bt) (not (in ?p ?b)) (increase (total-cost) 1))
 )
  (:action arrivebybus
  :parameters (?p ?bt ?b ?a)
  :precondition (and (person ?p) (bus ?b) (airport ?a) (bus-terminal ?bt) (at ?p ?bt))
  :effect (AND (at ?p ?a) (not (at ?p ?bt)) (increase (total-cost) 1))
 )
  (:action check
  :parameters (?p ?sc)
  :precondition (AND (at ?p ?sc) (person ?p)(security ?sc))
  :effect (AND (verrify ?p)(increase (total-cost) 1))
  )
  (:action walksc
  :parameters (?p ?a ?sc ?g)
  :precondition (AND (person ?p)(airport ?a)(security ?sc) (at ?p ?a))
  :effect (AND (at ?p ?sc) (not (at ?p ?a))(increase (total-cost) 1))
  )
  (:action walkgate
  :parameters (?p ?a ?sc ?g)
  :precondition (AND (person ?p) (security ?sc) (gate ?g) (at ?p ?sc) (verrify ?p))
  :effect (AND (at ?p ?g) (not (at ?p ?sc))(increase (total-cost) 1))
  )
  (:action board
  :parameters (?p ?f ?g)
  :precondition (AND (at ?p ?g) (gate ?g) (flight ?f) (person ?p))
  :effect (AND (in ?p ?f) (not (at ?p ?g))(increase (total-cost) 1))
  )  
)
