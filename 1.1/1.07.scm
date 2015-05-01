; Exercise 1.7.

; The good-enough? test used in computing square roots will not be very
; effective for finding the square roots of very small numbers. Also, in real
; computers, arithmetic operations are almost always performed with limited
; precision. This makes our test inadequate for very large numbers. Explain
; these statements, with examples showing how the test fails for small and
; large numbers. An alternative strategy for implementing good-enough? is to
; watch how guess changes from one iteration to the next and to stop when the
; change is a very small fraction of the guess. Design a square-root
; procedure that uses this kind of end test. Does this work better for small
; and large numbers?

; Current good-enough? test:
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; this test performs poorly for finding the square roots of very small
; numbers: imagine if we were comparing guess = 0.00001 and x = 0.
; 0000000000001. Despite being several orders of magnitude off, this pair is
; deemed good-enough by this test.

; this test performs poorly for very large numbers. imagine finding the
; square root of a number like 4.3562354e30. Arithmetic operations are not
; precise enough to compare numbers of this magnitude down to the thousandth
; place. the program could run forever, since good-enough may never pass.

(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.001)
(define (good-enough? guess prev-guess)
  (< (abs (/ (- guess prev-guess) prev-guess)) tolerance))

(define (sqrt x)
  (sqrt-iter 1.0 x x))
