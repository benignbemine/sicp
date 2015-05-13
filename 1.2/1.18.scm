; Exercise 1.18.  Using the results of exercises 1.16
; and 1.17, devise a procedure that generates an iterative
; process for multiplying two integers in terms of adding,
; doubling, and halving and uses a logarithmic number of steps.



; Note, this only handle positive integers.

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (mult a b)
  (mult-iter a b 0))

; Iterative method
(define (mult-iter a b n)
  (cond ((= b 0) n)
        ((odd? b) (mult-iter a (- b 1) (+ n a)))
        (else (mult-iter (double a) (halve b) n))))
