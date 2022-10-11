let tree_analyse t mem =
  let bt = Tree.eval_bottom_top mem t in
  Tree.eval_top_bottom mem bt |> ignore

let stop_condition (old : Memory.t) (new' : Memory.t) =
  let keys = Hashtbl.to_seq_keys old in
  let rec aux = function
    | Seq.Nil -> true
    | Seq.Cons (a, b) ->
        let get_size m = Hashtbl.find m a |> Interval.size in
        let size1 = get_size old in
        let size2 = get_size new' in
        if size1 -. size2 > 0.1 then false else aux (b ())
  in
  aux (keys ())

let constraint_inter (mem, t) =
  let queue = Queue.create () in
  List.iter (fun e -> Queue.add e queue) t;
  let rec repeat () =
    let old = Hashtbl.copy mem in
    if Queue.is_empty queue then ()
    else
      let t = Queue.take queue in
      tree_analyse t mem;
      if stop_condition old mem then repeat ()
      else (
        Queue.add t queue;
        repeat ())
  in
  repeat ()
