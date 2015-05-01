; Exercise 1.5

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; Ben runs: What behavior will Ben observe with an interpreter that uses
; applicative-order evaluation? What behavior will he observe with an
; interpreter that uses normal-order evaluation? Explain your answer.
(test 0 (p))

; Normal order evaluation -> fully expand and then reduce. The operands are
; not evaluated into their values are needed.
; Applicative-order evaluation -> the interpreter first evaluates the
; operator and operands and then applies the resulting procedure to the
; resulting arguments

; p is a function which calls itself, it will run infinitely if executed.

; using normal order evaluation, p will never be evaluated, since x = 0.

; using applicative order evaluation, the operands are evaluated before they
; run through the conditional, so p will be called and will run infinitely.
; in this case, the program will never return a value.


