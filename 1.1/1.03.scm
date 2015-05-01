; Exercise 1.3

(define (square a) (* a a))

(define (sum-square a b) (+ (square a) (square b)))

(define (square-largest-two a b c)
  (cond ((>= a b) (if (>= b c) (sum-square a b) (sum-square a c)))
        ((>= a c) (sum-square a b))
        (else (sum-square b c))
  )
)