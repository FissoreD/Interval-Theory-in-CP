(*
  x ∈ [−2, 5]
  y ∈ [−3, 7]
  z ∈ [4, 9]

  x + y − z = 5 → 5 ∈ [−14, 8] ⇒ peut-etre une solution
  3z ≤ 10 → 10 < [12, 27] ⇒ pas de solution
  x + y + z ≥ 10 → 10 ∈ [−1, 21] ⇒ peut-etre une solution
  x × y + y × z != 0 → [0, 0] != [−42, 98] ⇒ peut-etre une solution
*)

open IntervalTheoryInCP
open Interval

let x = make_interval (-2.) 5.
let y = make_interval (-3.) 7.
let z = make_interval 4. 9.

let test_constraints () =
  let a1 = x ++ y -- z == make_interval 5. 5. in
  let a2 = make_interval 3. 3. ** z <<= make_interval 10. 10. in
  let a3 = x ++ y ++ z >>= make_interval 10. 10. in
  let a4 = (x ** y) ++ (y ** z) == make_interval 0. 0. in
  assert (a1 <> empty);
  assert (a2 = empty);
  assert (a3 <> empty);
  assert (a4 <> empty)
