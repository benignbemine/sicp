; Exercise 1.20.  The process that a procedure generates is of course
; dependent on the rules used by the interpreter. As an example, consider
; the iterative gcd procedure given above. Suppose we were to interpret
; this procedure using normal-order evaluation, as discussed in section 1.1
; .5. (The normal-order-evaluation rule for if is described in exercise 1.5
; .) Using the substitution method (for normal order), illustrate the
; process generated in evaluating (gcd 206 40) and indicate the remainder
; operations that are actually performed. How many remainder operations
; are actually performed in the normal-order evaluation of (gcd 206 40)?
; In the applicative-order evaluation?


(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


; Applicative order: evaulate the arguments, then apply the procedure.
; Normal order: fully expand the procedure, then reduce.

; Applicative order: 4 remainder operations performed
(gcd 206 40)
(gcd 40 6) ; #1
(gcd 6 4) ; #2
(gcd 4 2) ; #3
(gcd 2 0) ; #4
; => 2

; Normal order: 25 remainder operations performed
(gcd 206 40)
(gcd 40 (remainder 206 40)) ; 1 remainder for (= b 0)
(gcd (remainder 206 40)
     (remainder 40 (remainder 206 40))) ; 2 remainders for (= b 0)

(gcd (remainder 40 (remainder 206 40))  ; 4 remainders for (= b 0)
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40))))

(gcd (remainder (remainder 206 40) ; 7 remainders for (= b 0)
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))

; All of these 11 remainders will be evaluated from the
; inside out. In addition, for each recursive call, a number
; of remainder operations were evaluated to compute (= b 0).
; This number is written to the right of each call.

(gcd 2 0)
; => 2











