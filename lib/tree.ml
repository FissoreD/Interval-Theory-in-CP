type node_cnt = { op : Operator.t; i : Interval.t; r : tree; l : tree }
and leaf = Var of string | Const of float | Interval of Interval.t
and tree = Leaf of leaf | Node of node_cnt | Empty

let get_leaf_interval mem = function
  | Const f -> Interval.make_interval f f
  | Var v -> Hashtbl.find mem v
  | Interval i -> i

let get_interval mem = function
  | Node { i = i1; _ }, Node { i = i2; _ } -> (i1, i2)
  | Leaf i1, Leaf i2 -> (get_leaf_interval mem i1, get_leaf_interval mem i2)
  | Leaf i1, Node { i = i2; _ } -> (get_leaf_interval mem i1, i2)
  | Node { i = i1; _ }, Leaf i2 -> (i1, get_leaf_interval mem i2)
  | _ -> Interval.(empty, empty)

let rec eval_bottom_top mem = function
  | Node { op; r; l; _ } ->
      let f = Operator.op_to_fun op in
      let l = eval_bottom_top mem l in
      let r = eval_bottom_top mem r in
      let i1, i2 = get_interval mem (l, r) in
      Node { op; i = f i1 i2; l; r }
  | t -> t

let eval_top_bottom mem tree =
  let open Interval in
  let rec aux (res : Interval.t) = function
    | Node { op; r; l; _ } ->
        let i1, i2 = get_interval mem (l, r) in
        let l, r =
          match op with
          | Add -> (aux ((res -- i2) && i1) l, aux ((res -- i1) && i2) r)
          | Mul -> (aux ((res // i2) && i1) l, aux ((res // i1) && i2) r)
          | Sub -> (aux ((res ++ i2) && i1) l, aux ((i1 -- res) && i2) r)
          | Div -> (aux ((res ** i2) && i1) l, aux ((i1 // res) && i2) r)
          | t ->
              let msg = "Find a non valid operator : " ^ Operator.op_to_str t in
              failwith msg
        in
        Node { op; i = res; l; r }
    | Leaf (Var x) as l ->
        Hashtbl.replace mem x res;
        l
    | l -> l
  in
  match tree with
  | Node { i; l; r; op } -> (
      match r with
      | Leaf _ -> if is_empty i then Empty else Node { r; l = aux i l; op; i }
      | _ -> Empty)
  | l -> l

let rec print ?(infix = false) mem = function
  | Leaf (Var x) -> Interval.print (Hashtbl.find mem x)
  | Leaf (Const f) -> print_string (string_of_float f)
  | Leaf (Interval i) -> Interval.print i
  | Node { op; l; r; i } ->
      print_string "(";
      if not infix then (
        print ~infix mem l;
        print_string " ");
      Operator.op_to_str op |> print_string;
      Interval.print i;
      if infix then (
        print_string " ";
        print ~infix mem l);
      print_string " ";
      print ~infix mem r;
      print_string ")"
  | Empty -> print_string "Empty"
