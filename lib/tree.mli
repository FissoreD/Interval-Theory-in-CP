type node_cnt = { op : Operator.t; i : Interval.t; r : tree; l : tree }
and leaf = Var of string | Const of float | Interval of Interval.t
and tree = Leaf of leaf | Node of node_cnt | Empty

val get_leaf_interval : Memory.t -> leaf -> Interval.t
val get_interval : Memory.t -> tree * tree -> Interval.t * Interval.t
val eval_bottom_top : Memory.t -> tree -> tree
val eval_top_bottom : Memory.t -> tree -> tree
val print : ?dec:int -> ?infix:bool -> Memory.t -> tree -> unit
