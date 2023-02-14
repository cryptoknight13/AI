(define (domain gripper)
    (:types

    )

    (:constants

    )

    (:predicates (room ?r)(ball ?b)(gripper ?g)(at-robby ?r)(at-ball ?b ?r)(free ?g)(carry ?g ?b)
    
    )

    (:functions

    )

    (:action move
        :parameters (?x ?y)
        :precondition (and (room ?x) (room ?y) (at-robby ?x))
        :effect (and (at-robby ?y) (not (at-robby ?x)))
    )
    
    (:action pick
        :parameters ( ?b ?r ?g)
        :precondition (and (room ?r) (ball ?b) (gripper ?g) (free ?g) (at-robby ?r) (at-ball ?b ?r))
        :effect (and (not (free ?g)) (carry ?g ?b) (not (at-ball ?b ?r)))
    )
    
    (:action drop
        :parameters (?b ?r ?g)
        :precondition (and (room ?r) (ball ?b) (gripper ?g) (carry ?g ?b) (at-robby ?r))
        :effect (and (free ?g) (at-ball ?b ?r) (not (carry ?g ?b)))
    )
)