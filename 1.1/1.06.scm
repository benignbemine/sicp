; Exercise 1.06

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; What happens when Alyssa attempts to use this to compute square roots?

; sqrt-iter will be evaluated regardless of whether the conditional is
; satisfied or not, since it is an argument to new-if. this will cause
; the program to run infinitely (there is no stop condition). this is
; a result of the interpreter using applicative evaluation.
