(** 
  Private method : modify the iterval of variables reading the tree
  from the bottom to the top and then from the top to the bottom
  propagating the intervals downward
*)
let tree_analyse t mem =
  let bt = Tree.eval_bottom_top mem t in
  Tree.eval_top_bottom mem bt

(** 
  As specified in the description of constraint_inter in the mli file, 
  we can remove a constraint if it does not modify the interval of any variable
  more then ~precision  
*)
let stop_condition ~precision (mem : Memory.t) =
  let keys = Hashtbl.to_seq_keys mem in
  let rec aux = function
    | Seq.Nil -> true
    | Seq.Cons (a, b) ->
        let mem = Hashtbl.find mem a in
        if Interval.is_empty mem.current then true
        else
          let size1 = Interval.size mem.old in
          let size2 = Interval.size mem.current in
          if size1 -. size2 > precision then false else aux (b ())
  in
  aux (keys ())

let constraint_inter ?(dec = 3) ?(print_tree = false) ?(verbose = false)
    ?(precision = 0.1) (mem, t) =
  let queue = Queue.create () in
  List.iter (fun e -> Queue.add e queue) t;
  let rec repeat () =
    if Queue.is_empty queue then ()
    else
      let t = Queue.take queue in
      let t' = tree_analyse t mem in
      if verbose then (
        Memory.print ~dec mem;
        print_endline "");
      if print_tree then (
        Tree.print ~dec ~simple_version:false mem t';
        print_endline "");
      if stop_condition ~precision mem then repeat ()
      else (
        Queue.add t queue;
        repeat ())
  in
  repeat ()
