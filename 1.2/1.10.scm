(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
;Value: 1024
(A 2 4)
;Value: 65536
(A 3 3)
;Value: 65536

; Consider the following procedures, where A is the procedure defined above:
; Give concise mathematical definitions for the functions computed by the
; procedures f, g, and h for positive integer values of n. For example, (k n) computes 5n2.

(define (f n) (A 0 n))
; => f(n) = 2*n

(define (g n) (A 1 n))
; => g(n) = 2^n

(define (h n) (A 2 n))
; => h(n) = 2 ^ 2 ^ 2 ... n times
; this is the same as:
; h(1) = 2;
; h(n > 1) = 2 ^ h(n-1);

(define (k n) (* 5 n n))
; => h(n) = 5*(n^2)