; Exercise 1.25.

; Alyssa P. Hacker complains that we went to a lot of extra work
; in writing expmod. After all, she says, since we already know
; how to compute exponentials, we could have simply written

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; For reference:
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; Is she correct? No.
; Would this procedure serve as well for our fast prime tester? Explain. No.

; expmod - since we are calling remainder at each step, we are never dealing
; with huge numbers. expmod is based on the fact that a^n mod p = (a^n/2 mod p)^2 mod p
; fast-expt on the other hand, calculates the large
; number and then calls remainder on it. Performing operations with
; large numbers is more expensive.
