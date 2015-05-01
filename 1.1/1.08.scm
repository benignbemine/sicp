; Newton's method for cube roots is based on the fact that if y is an
; approximation to the cube root of x, then a better approximation is given
; by the value

; ((x / y^2) + 2y ) / 3


(define (cubert x)
  (define (cubert-iter guess prev-guess)
    (if (good-enough? guess prev-guess)
        guess
        (cubert-iter (improve guess) guess)))

  (define (improve guess)
    (/ (+ (/ x (square guess))
          (* 2 guess))
       3))

  (define (square a)
    (* a a))

  (define tolerance 0.001)

  (define (good-enough? guess prev-guess)
    (< (abs (/ (- guess prev-guess) prev-guess)) tolerance))

  (cubert-iter 1.0 x))

