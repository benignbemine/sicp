; Exercise 1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; you can manipulate functions as values => here we use the 'if' statement to select the operator.