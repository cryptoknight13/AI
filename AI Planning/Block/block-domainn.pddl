(define (domain blocks)

    (:requirements :strips :typing)

    (:types block)

    (:constants

    )

    (:predicates
                (clear ?x - block)
                (holding ?x - block)
                (ontable ?x - block)
                (handempty)
                (on ?x - block ?y - block)
    )

    (:functions

    )

    (:action putup
        :parameters (?x - block)
        :precondition (and (ontable ?x) (clear ?x) (handempty))
        :effect (and (not (handempty)) (not (ontable ?x)) (not (clear ?x)) (holding ?x))
    )
    (:action putdown 
        :parameters (?x - block)
        :precondition (and (holding ?x))
        :effect (and (not (holding ?x)) (clear ?x) (ontable ?x) (handempty))
    )
    (:action stack 
        :parameters (?x - block ?y - block)
        :precondition (and (clear ?y) (holding ?x))
        :effect (and (not (holding ?x)) (not (clear ?y)) (clear ?x) (handempty) (on ?x ?y))
    )
    (:action unstack 
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (handempty) (clear ?x))
        :effect (and (clear ?y) (holding ?x) (not (handempty)) (not (on ?x ?y)) (not (clear ?x)))
    )
)