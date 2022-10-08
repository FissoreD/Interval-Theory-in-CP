open Interval

type t = Mul | Add | Sub | Div | Leq | Geq | Inter | Union | Eql

let op_to_cpl = function
  | Mul -> (( ** ), "*")
  | Add -> (( ++ ), "+")
  | Sub -> (( -- ), "-")
  | Div -> (( // ), "/")
  | Leq -> (( <<= ), "≤")
  | Geq -> (( >>= ), "≥")
  | Eql -> (( == ), "=")
  | Inter -> (( || ), "∩")
  | Union -> (( || ), "U")

let op_to_fun op = fst (op_to_cpl op)
let op_to_str op = snd (op_to_cpl op)
let is_comparator = function Leq | Geq | Eql -> true | _ -> false
