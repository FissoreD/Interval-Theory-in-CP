open Interval

module Binary = struct
  type t = Mul | Add | Sub | Div | Leq | Geq | Inter | Union | Eql

  let op_to_cpl = function
    | Mul -> (( ** ), "*")
    | Add -> (( ++ ), "+")
    | Sub -> (( -- ), "-")
    | Div -> (( // ), "/")
    | Leq -> (( <<= ), "<=")
    | Geq -> (( >>= ), ">=")
    | Eql -> (( == ), "=")
    | Inter -> (( && ), "∩")
    | Union -> (( || ), "U")

  let inv_op i1 i2 r = function
    | Add -> (i1 && (r -- i2), i2 && (r -- i1))
    | Mul -> (i1 && (r // i2), i2 && (r // i1))
    | Sub -> (i1 && (r ++ i2), i2 && (i1 -- r))
    | Div -> (i1 && (r ** i2), i2 && (i1 // r))
    | _ -> invalid_arg "Inverse binary operator not implemented (operator.ml)"

  let op_to_fun op = fst (op_to_cpl op)
  let op_to_str op = snd (op_to_cpl op)
  let is_comparator = function Leq | Geq | Eql -> true | _ -> false
end

module Unary = struct
  type t = Sub

  let op_to_cpl = function
    | Sub -> ((fun a -> Interval.make_interval 0. 0. -- a), "-")

  let inv_op i1 r = function Sub -> i1 && (make_interval 0. 0. -- r)
  let op_to_fun op = fst (op_to_cpl op)
  let op_to_str op = snd (op_to_cpl op)
end