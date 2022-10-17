type bin_node = { op : Operator.Binary.t; i : Interval.t; r : tree; l : tree }
and unary_node = { opu : Operator.Unary.t; iu : Interval.t; c : tree }
and leaf = Var of string | Const of float | Interval of Interval.t

and tree =
  | Leaf of leaf
  | UnaryNode of unary_node
  | BinNode of bin_node
  | Empty

val get_leaf_interval : Memory.t -> leaf -> Interval.t
val get_interval : Memory.t -> tree -> Interval.t
val eval_bottom_top : Memory.t -> tree -> tree
val eval_top_bottom : Memory.t -> tree -> tree

val print :
  ?simple_version:bool -> ?dec:int -> ?infix:bool -> Memory.t -> tree -> unit

val to_dot : ?intervals:bool -> ?dec:int -> Memory.t -> tree -> string
