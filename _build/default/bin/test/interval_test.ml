open IntervalTheoryInCP.Interval
open IntervalTheoryInCP

(*
   [−2, 5] × [−2, 4] = [−10, 20]
   [1, 3] × [−2, 5] − [2, 4] = [−10, 13]
   [−10, 9] + [−2, 3] × [−5, 3] − [−1, 6] = [−31, 2]
*)
let solve (a, b) = make_interval a b

let my_assert op i1 i2 exp =
  print i1;
  Operator.Binary.op_to_str op |> print_string;
  print i2;
  print_char '=';
  print exp;
  print_endline "";
  assert ((Operator.Binary.op_to_fun op) i1 i2 = exp)

let rec aux op = function
  | a1 :: b1, a2 :: b2, a3 :: b3 ->
      my_assert op a1 a2 a3;
      aux op (b1, b2, b3)
  | _ -> ()

let test_interval_sum () =
  let i1 = List.map solve [ (-2., 3.); (-5., 5.) ] in
  let i2 = List.map solve [ (2., 4.); (2., 4.) ] in
  let res = List.map solve [ (0., 7.); (-3., 9.) ] in
  aux Add (i1, i2, res)

let test_interval_sub () =
  let i1 = make_interval (-2.) 3. in
  let i2 = make_interval 2. 4. in
  let res = make_interval (-6.) 1. in
  my_assert Sub i1 i2 res

let test_interval_mul () =
  let i1 = List.map solve [ (-2., 3.); (-2., 5.) ] in
  let i2 = List.map solve [ (2., 4.); (-2., 4.) ] in
  let res = List.map solve [ (-8., 12.); (-10., 20.) ] in
  aux Mul (i1, i2, res)

let test_interval_div () =
  let i1 = make_interval (-2.) 3. in
  let i2 = make_interval 2. 4. in
  let res = make_interval (-1.) 1.5 in
  my_assert Div i1 i2 res

let test_unary_sub () =
  let i1 = make_interval (-2.) 5. in
  assert ((Operator.Unary.op_to_fun Sub) i1 = make_interval (-5.) 2.)
