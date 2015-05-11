; Exercise 1.13.

; Prove that Fib(n) is the closest integer to p^n/sqrt(5),
; where p = (1 + sqrt(5))/2. Hint: Let q = (1 - sqrt(5))/2.
; Use induction and the definition of the Fibonacci numbers
; to prove that Fib(n) = (p^n - q^n)/sqrt(5).

; I have divided this problem into three steps:
;   1) Background info on golden ratio
;   2) Induction proof that Fib(n) = (p^n - q^n)/sqrt(5).
;   3) Proof that Fib(n) is the closest integer to p^n/sqrt(5)

; ////////////////////////////////
;           GOLDEN RATIO
; ////////////////////////////////

; First, note that the p = (1 + sqrt(5))/2 = golden ratio!

; The golden ratio is defined by phi = (a + b) / a = a / b
; Geometrically, this means that for a line divided into parts a and b:
; _________|___
; a         b

; The ratio between the length of larger section to the smaller section is equal to
; the ratio between the length entire line to the largest section.

; Now, doing some algebra:
golden ratio = phi = a / b
; and
golden ratio = phi = (a + b) / a
                   = a/a + b/a
                   = 1 + b/a
                   = 1 + 1/phi

=> phi = 1 + 1/phi
=> phi^2 = phi + 1
=> phi^2 - phi - 1 = 0

; Using the quadratic formula, we see that this
; quadratic equation has two solutions:
solutions = (1 +- sqrt(5)) / 2
; Notice, these are the values for p and q we are given!!!

; ////////////////////////////////
;      PROOF BY INDUCTION
; ////////////////////////////////

; Now, a proof by induction that Fib(n) = (p^n - q^n)/sqrt(5),
; where p = (1 + sqrt(5))/2 and q = (1 - sqrt(5))/2.

; Base cases:
Fib(0) = (p^0 - q^0) / sqrt(5)
       = (1 - 1) / sqrt(5)
       = 0

Fib(1) = (p^1 - q^1) / sqrt(5)
       = ((1 + sqrt(5))/2 - (1 - sqrt(5))/2) / sqrt(5)
       = ((0 + 2sqrt(5)) / 2) / sqrt(5)
       = (sqrt(5)) / sqrt(5)
       = 1

; Induction:
; The definition of the fibonacci numbers is:
Fib(n) = 0 if n = 0
       = 1 if n = 1
       = Fib(n-1) + Fib(n-2) if n > 1

; Assume that Fib(n) = (p^n - q^n) / sqrt(5)
;         and Fib(n-1) = (p^(n-1) - q^(n-1)) / sqrt(5).

; We want to show that Fib(n+1) = (p^(n+1) - q^(n+1)) / sqrt(5)

Fib(n+1) = Fib(n) + Fib(n-1)
         = (p^n - q^n) / sqrt(5) + (p^(n-1) - q^(n-1)) / sqrt(5)
         = ((p + 1) * p^(n-1) - (q + 1) * q^(n-1)) / sqrt(5)

; but, notice from line 36 that for both zeroes to the
; quadtratic equation satsify phi^2 = phi + 1.
; Therefore,

Fib(n+1) = ((p + 1) * p^(n-1) - (q + 1) * q^(n-1)) / sqrt(5)
         = ((p^2) * p^(n-1) - (q^2) * q^(n-1)) / sqrt(5)
         = (p^(n+1) - q^(n+1)) / sqrt(5)

; Proved!!

; ////////////////////////////////
;      SOLVING THE PROMPT
; ////////////////////////////////

; Now, the prompt wants us to show that
; Fib(n) is the closest integer to p^n/sqrt(5), where
; p = (1 + sqrt(5))/2.
; For it to be the closest integer, this absolute value
; must hold true:

| Fib(n) - p^n / sqrt(5) | < 0.5

; Now, using the result from line 48
| Fib(n) - p^n / sqrt(5) | < 0.5
| (p^n - q^n) / sqrt(5) - p^n / sqrt(5) | < 0.5
| - q^n / sqrt(5) | < 0.5

; from the definition of q above

| - ((1 - sqrt(5))/2)^n / sqrt(5) | < 0.5
| - (-0.61803398875) ^ n / sqrt(5) | < 0.5
| - (-0.61803398875) ^ n | < 1.11803398875

; For natural numbers, as n grows larger (-0.61803398875) ^ n approaches 0.
; the max is at 0 with a value of 1 which is less that 1.11803398875

; Therefore, Fib(n) is the closest integer to p^n/sqrt(5).
; end proof
