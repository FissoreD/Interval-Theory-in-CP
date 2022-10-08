type node_cnt = { op : Operator.t; i : Interval.t; r : tree; l : tree }
and leaf = Interv of string | Const of float
and tree = Leaf of Interval.t | Node of node_cnt

type decorated_tree = { tree : tree; mem : (string, Interval.t) Hashtbl.t }

let rec eval_bottom_top = function
  | Node { op; r; l; _ } ->
      let f = Operator.op_to_fun op in
      let l = eval_bottom_top l in
      let r = eval_bottom_top r in
      let i1, i2 =
        match (l, r) with
        | Leaf i1, Leaf i2
        | Leaf i1, Node { i = i2; _ }
        | Node { i = i1; _ }, Leaf i2
        | Node { i = i1; _ }, Node { i = i2; _ } ->
            (i1, i2)
      in
      Node { op; i = f i1 i2; l; r }
  | t -> t

let eval_top_bottom tree =
  let open Interval in
  let rec aux (res : Interval.t) = function
    | Node { op; r; l; _ } ->
        let i1, i2 =
          match (l, r) with
          | Leaf i1, Leaf i2
          | Leaf i1, Node { i = i2; _ }
          | Node { i = i1; _ }, Leaf i2
          | Node { i = i1; _ }, Node { i = i2; _ } ->
              (i1, i2)
        in
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
    | _ -> Leaf res
  in
  let open Interval in
  match tree with
  | Node { i; l; r; op } -> (
      match r with
      | Leaf _ ->
          if is_empty i then Leaf empty else Node { r; l = aux i l; op; i }
      | _ -> Leaf Interval.empty)
  | l -> l

let rec print ?(infix = false) = function
  | Leaf l -> Interval.print l
  | Node { op; l; r; i } ->
      print_string "(";
      if not infix then (
        print ~infix l;
        print_string " ");
      Operator.op_to_str op |> print_string;
      Interval.print i;
      if infix then (
        print_string " ";
        print ~infix l);
      print_string " ";
      print ~infix r;
      print_string ")"
