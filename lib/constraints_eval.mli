val constraint_inter :
  ?dec:int ->
  ?print_tree:bool ->
  ?verbose:bool ->
  ?precision:float ->
  Memory.t * Tree.tree list ->
  unit
(** 
  It calculates the intersection between a list of constraints on a given tree and a 
  memory. 
  A constraint is considered valid until it allows to modify (reduce) the interval
  of ~precision at least one variable in memory. 
  Note that the precision is used in this way :
    let x be a variable with interval Ix before applying the constraint c_x, and I'x the 
    interval of x after applying c_x. If the size of Ix - I'x > ~precision
    then we say that the constraint must be reused to improve the interval of our variables.
    Otherwise, if there doesn't exist any variable x' that is reduced in this way, then 
    we can ignore this constraint since it will not be usefull anymore.
*)

val stop_condition : precision:float -> Memory.t -> bool
(** 
  As specified in the description of constraint_inter in the mli file, 
  we can remove a constraint if it does not modify the interval of any variable
  more then ~precision  
*)