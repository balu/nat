type nat = Zero | Succ of nat | Twice of nat

let rec make (n : int) =
  if n = 0 then Zero
  else if n mod 2 = 0 then Twice (make (n/2))
  else Succ (make (n-1))

(* succ is constant-time for even n and log(n) time for odd n *)
let rec succ (n : nat) =
  match n with
    Zero -> Succ Zero
  | Succ Zero -> Twice (Succ Zero)
  | Twice k -> Succ (Twice k)
  | Succ (Twice k) -> Twice (succ k)
  | Succ (Succ _) -> failwith "succ: invalid number."

let twice (n : nat) =
  match n with
    Zero -> Zero
  | n -> Twice n

let rec add (n : nat) (m : nat) =
  match (n, m) with
    k, Zero | Zero, k -> k
  | k, Succ Zero | Succ Zero, k -> succ k
  | Twice n, Twice m -> twice (add n m)
  | Twice n, Succ (Twice m) -> succ (twice (add n m))
  | Succ (Twice n), Twice m -> succ (twice (add n m))
  | Succ (Twice n), Succ (Twice m) ->
    let add1 (n : nat) (m : nat) =
      succ (add n m)
    in twice (add1 n m)
  | Succ (Succ _), _ | _, Succ (Succ _) -> failwith "add: invalid number."
