; Exercise 1.16.

; Design a procedure that evolves an iterative exponentiation
; process that uses successive squaring and uses a logarithmic
; number of steps, as does fast-expt. (Hint: Using the observation
; that (b^n/2)2 = (b^2)n/2, keep, along with the exponent n
; and the base b, an additional state variable a, and define
; the state transformation in such a way that the product a b^n
; is unchanged from state to state. At the beginning of the process
;  a is taken to be 1, and the answer is given by the value of a at
; the end of the process. In general, the technique of defining an
; invariant quantity that remains unchanged from state to state is
; a powerful way to think about the design of iterative algorithms.)


(define (exponent x n)
        (exponent-iter x n 1))

(define (square x)
        (* x x))

(define (exponent-iter x n a)
        (cond ((= n 0) a)
              ((odd? n) (exponent-iter x (- n 1) (* a x)))
              (else (exponent-iter (square x) (/ n 2) a))))

; How this works:
; The values within the parentheses represent the update
; values of x: (square x) if n is even, x if it is odd.
; The exponents on the outside represent n: (/ n 2) if
; it is even, and (- n 1) if it is odd.
; When we arrive at an odd n, we update a. Otherwise, we
; keep squaring x and dividing n by 2.

 x^8
(x^2)^4
(x^4)^2
(x^8)^1
=> return a which is (* a x) = 1 * x^8

; Note: In mathematics, an invariant is a property,
; held by a class of mathematical objects, which remains
; unchanged when transformations of a certain type are applied
; to the objects. The particular class of objects and type
; of transformations are usually indicated by the context
; in which the term is used. In this case, the invariant
; quantity is a * x^n.