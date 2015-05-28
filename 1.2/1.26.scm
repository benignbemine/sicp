; Exercise 1.26.

; Louis Reasoner is having great difficulty doing exercise 1.24.
; His fast-prime? test seems to run more slowly than his prime?
; test. Louis calls his friend Eva Lu Ator over to help.
; When they examine Louis's code, they find that he has rewritten
; the expmod procedure to use an explicit multiplication, rather than calling square:

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; ``I don't see what difference that could make,'' says Louis.
; ``I do.'' says Eva. ``By writing the procedure like that,
; you have transformed the (log n) process into a (n) process.'' Explain.

; When square was being used in the procedure, we calculated
; (expmod base (/ exp 2) m) once for each recursive call, and
; then squared the value we recieve. Now, for each recursive
; call, we are calculating the same (expmod base (/ exp 2) m)
; twice, thus multiplying the number of steps we performed for
; that call by two! Now, the number of recursive calls
; grows exponentially with n.

                           (expmod base exp m)
                          /                 \
              (expmod base exp/2 m)         (expmod base exp/2 m)
             /                     \
        (expmod base exp/4 m)      (expmod base exp/2 m)
        /                  \
(expmod base exp/8 m)

; and so on.
; This means that, while before we performed log(n) calls,
; we are now performing log(2^n) => log(n) calls