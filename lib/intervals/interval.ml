type t = (float * float) option

let make_interval a b = Some (min a b, max a b)
let empty = None
let is_empty = Option.is_none

let ( ++ ) i1 i2 =
  match (i1, i2) with
  | None, _ | _, None -> None
  | Some (a, b), Some (c, d) -> Some (a +. c, b +. d)

let ( -- ) i1 i2 =
  match (i1, i2) with
  | None, _ | _, None -> None
  | Some (a, b), Some (c, d) -> Some (a -. d, b -. c)

let times_div op i1 i2 =
  match (i1, i2) with
  | None, _ | _, None -> None
  | Some (a, b), Some (c, d) ->
      let l = [ op a c; op a d; op b c; op b d ] in
      Some
        (List.fold_left
           (fun (a, b) x -> (min a x, max b x))
           (max_float, min_float) l)

let ( ** ) = times_div ( *. )
let ( // ) = times_div ( /. )

let inter_union op1 op2 (i1 : t) (i2 : t) : t =
  match (i1, i2) with
  | None, _ | _, None -> None
  | Some (a, b), Some (c, d) ->
      let a, b = (op1 a c, op2 b d) in
      if a <= b then make_interval a b else empty

let ( && ) = inter_union max min
let ( || ) = inter_union min max
let ( >>= ) i1 (i2 : t) = i1 && Option.map (fun (_, a) -> (a, max_float)) i2
let ( <<= ) i1 (i2 : t) = i1 && Option.map (fun (a, _) -> (min_float, a)) i2
let ( == ) (i1 : t) (i2 : t) = i1 && Option.map (fun (a, _) -> (a, a)) i2
let size : t -> float = function None -> 0. | Some (a, b) -> b -. a

let to_string ?(dec = 0) = function
  | None -> "[]"
  | Some (a, b) -> Printf.sprintf "[%.*f, %.*f]" dec a dec b

let print ?(dec = 0) t = print_string (to_string ~dec t)
