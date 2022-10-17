type bin_node = { op : Operator.Binary.t; i : Interval.t; r : tree; l : tree }
and unary_node = { opu : Operator.Unary.t; iu : Interval.t; c : tree }
and leaf = Var of string | Const of float | Interval of Interval.t

and tree =
  | Leaf of leaf
  | UnaryNode of unary_node
  | BinNode of bin_node
  | Empty

let get_leaf_interval (mem : Memory.t) = function
  | Const f -> Interval.make_interval f f
  | Var v -> (Hashtbl.find mem v).current
  | Interval i -> i

let get_interval mem = function
  | Leaf i1 -> get_leaf_interval mem i1
  | Empty -> Interval.(empty)
  | UnaryNode { iu = i1; _ } | BinNode { i = i1; _ } -> i1

let rec eval_bottom_top (mem : Memory.t) = function
  | BinNode { op; r; l; _ } ->
      let f = Operator.Binary.op_to_fun op in
      let l = eval_bottom_top mem l in
      let r = eval_bottom_top mem r in
      let i1, i2 = (get_interval mem l, get_interval mem r) in
      let i = f i1 i2 in
      if Interval.is_empty i then Memory.empty_memory mem;
      BinNode { op; i; l; r }
  | UnaryNode { opu; c; _ } ->
      let f = Operator.Unary.op_to_fun opu in
      let c = eval_bottom_top mem c in
      let i1 = get_interval mem c in
      UnaryNode { opu; iu = f i1; c }
  | Leaf _ as l -> l
  | Empty as e -> e

let eval_top_bottom mem tree =
  let open Interval in
  let rec aux (res : Interval.t) = function
    | BinNode { op; r; l; _ } ->
        let i1, i2 = (get_interval mem l, get_interval mem r) in
        let i1', i2' = Operator.Binary.inv_op i1 i2 res op in
        let l, r = (aux i1' l, aux i2' r) in
        BinNode { op; i = res; l; r }
    | UnaryNode { opu; c; _ } ->
        let i1 = get_interval mem c in
        let i1' = Operator.Unary.inv_op i1 res opu in
        let c = aux i1' c in
        UnaryNode { opu; iu = res; c }
    | Leaf (Var x) as l ->
        Memory.update (Hashtbl.find mem x) res;
        l
    | Leaf _ as l -> l
    | Empty as e -> e
  in
  match tree with
  | BinNode { i; l; r; op } -> (
      match r with
      | Leaf _ ->
          if is_empty i then Empty else BinNode { r; l = aux i l; op; i }
      | Empty | UnaryNode _ | BinNode _ -> Empty)
  | Empty | UnaryNode _ | Leaf _ -> Empty

let rec print ?(simple_version = false) ?(dec = 0) ?(infix = false)
    (mem : Memory.t) = function
  | Leaf (Var x) ->
      print_string x;
      if not simple_version then
        Interval.print ~dec (Hashtbl.find mem x).current
  | Leaf (Const f) -> Printf.printf "%.*f" dec f
  | Leaf (Interval i) -> Interval.print i
  | BinNode { op; l; r; i } ->
      print_string "(";
      if not infix then (
        print ~simple_version ~dec ~infix mem l;
        print_string " ");
      Operator.Binary.op_to_str op |> print_string;
      if not simple_version then Interval.print i;
      if infix then (
        print_string " ";
        print ~simple_version ~dec ~infix mem l);
      print_string " ";
      print ~simple_version ~dec ~infix mem r;
      print_string ")"
  | UnaryNode { opu; c; iu } ->
      Operator.Unary.op_to_str opu |> print_string;
      if not simple_version then Interval.print iu;
      print ~simple_version ~dec ~infix mem c
  | Empty -> print_string "Empty"

let cnt = ref 0

let to_dot ?(intervals = true) ?(dec = 3) (mem : Memory.t) t =
  let node_rename = Printf.sprintf "\"%d\" [label=\"%s\"]\n" in
  let build_link = Printf.sprintf "\"%d\" -> \"%d\"\n" in
  let add_interval i = if intervals then Interval.to_string ~dec i else "" in
  let rec aux name = function
    | Leaf (Var x) ->
        ( name,
          node_rename name @@ x ^ " "
          ^ add_interval (Hashtbl.find mem x).current )
    | Leaf (Const c) -> (name, node_rename name @@ Printf.sprintf "%.*f" dec c)
    | Leaf (Interval i) -> (name, node_rename name @@ add_interval i)
    | UnaryNode { opu; iu; c } ->
        let name1, child = aux (name + 1) c in
        let rename =
          node_rename name
          @@ Printf.sprintf "%s, %s"
               (Operator.Unary.op_to_str opu)
               (add_interval iu)
        in
        (name1, build_link name (name + 1) ^ child ^ rename)
    | BinNode { op; i; l; r } ->
        let n1, l1 = aux (name + 1) l in
        let n2, r1 = aux (n1 + 1) r in
        let rename =
          node_rename name
          @@ Printf.sprintf "%s, %s"
               (Operator.Binary.op_to_str op)
               (add_interval i)
        in
        ( n2,
          build_link name (name + 1)
          ^ build_link name (n1 + 1)
          ^ l1 ^ r1 ^ rename )
    | Empty -> (name, "Empty")
  in
  let n, res = aux !cnt t in
  cnt := n + 1;
  res
