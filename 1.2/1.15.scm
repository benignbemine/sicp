; Exercise 1.15

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

; How many times is the procedure p applied when (sine 12.15) is evaluated?

; 5 times.

; What is the order of growth in space and number of
; steps (as a function of a) used by the process generated
; by the sine procedure when (sine a) is evaluated?

; Space: O(log(n)). Steps: O(log(n)). Space and steps
; increase linearly as the input size triples.


