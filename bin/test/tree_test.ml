open IntervalTheoryInCP

(* [1, 3] × [−2, 5] − [2, 4] = [−10, 13] *)
let t2 : Tree.tree =
  let l : Tree.tree =
    let l : Tree.tree = Leaf (Interval (Interval.make_interval 1. 3.)) in
    let r : Tree.tree = Leaf (Interval (Interval.make_interval (-2.) 5.)) in
    Node { l; r; i = Interval.empty; op = Mul }
  in
  let r : Tree.tree = Leaf (Interval (Interval.make_interval 2. 4.)) in
  Node { l; r; i = Interval.empty; op = Sub }

(* [−10, 9] + [−2, 3] × [−5, 3] − [−1, 6] = [−31, 20] *)
let t3 : Tree.tree =
  let l : Tree.tree =
    let l : Tree.tree = Leaf (Interval (Interval.make_interval (-10.) 9.)) in
    let r : Tree.tree =
      let l : Tree.tree = Leaf (Interval (Interval.make_interval (-2.) 3.)) in
      let r : Tree.tree = Leaf (Interval (Interval.make_interval (-5.) 3.)) in
      Node { l; r; i = Interval.empty; op = Mul }
    in
    Node { l; r; i = Interval.empty; op = Add }
  in
  let r : Tree.tree = Leaf (Interval (Interval.make_interval (-1.) 6.)) in
  Node
    {
      l = Node { l; r; i = Interval.empty; op = Sub };
      r = Leaf (Interval (Interval.make_interval 1. 3.));
      i = Interval.empty;
      op = Geq;
    }

(* [−10, 9] + [−2, 3] >= 10 *)
let t4 : Tree.tree =
  let l : Tree.tree =
    let l : Tree.tree = Leaf (Interval (Interval.make_interval (-10.) 9.)) in
    let r : Tree.tree = Leaf (Interval (Interval.make_interval (-2.) 3.)) in
    Node { l; r; i = Interval.empty; op = Add }
  in
  let r : Tree.tree = Leaf (Interval (Interval.make_interval 10. 10.)) in
  Node { l; r; i = Interval.empty; op = Geq }

(* ([−10, 9] + [−2, 3]) + [2, 9] >= 10 *)
let t5 : Tree.tree =
  let l : Tree.tree =
    let l : Tree.tree =
      let l : Tree.tree = Leaf (Interval (Interval.make_interval (-10.) 9.)) in
      let r : Tree.tree = Leaf (Interval (Interval.make_interval (-2.) 3.)) in
      Node { l; r; i = Interval.empty; op = Add }
    in
    let r : Tree.tree = Leaf (Interval (Interval.make_interval 2. 9.)) in
    Node { l; r; op = Add; i = Interval.empty }
  in
  let r : Tree.tree = Leaf (Interval (Interval.make_interval 10. 10.)) in
  Node { l; r; i = Interval.empty; op = Geq }

let test_print () =
  let tbl = Hashtbl.create 0 in
  Tree.print tbl (Tree.eval_bottom_top tbl t2);
  print_endline "";
  Tree.print tbl (Tree.eval_bottom_top tbl t3);
  print_endline "";
  Tree.print tbl (Tree.eval_bottom_top tbl t4);
  print_endline "";
  Tree.print tbl (Tree.eval_top_bottom tbl (Tree.eval_bottom_top tbl t4));
  print_endline "";
  Tree.print tbl ~infix:true (Tree.eval_bottom_top tbl t5);
  print_endline "";
  Tree.print tbl ~infix:true
    (Tree.eval_top_bottom tbl (Tree.eval_bottom_top tbl t5));
  print_endline ""
