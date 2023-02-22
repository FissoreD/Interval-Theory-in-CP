open IntervalTheoryInCP
open Js_of_ocaml
module Set = Set.Make (Int)

let x : (Memory.t * Tree.tree array * Set.t * int) ref =
  ref (Hashtbl.create 0, [||], Set.empty, 0)

type op = UP | DOWN

let op = ref UP
let next_op () = op := match !op with UP -> DOWN | DOWN -> UP
let dec = ref 3
let precision = ref 0.1

let to_str_mem () =
  let mem, _, _, _ = !x in
  Memory.to_string ~dec:!dec mem |> Js.string

let to_dot () =
  let mem, t, ignore, currentpos = !x in
  let res =
    Array.mapi
      (fun pos e ->
        let str = Tree.to_dot ~dec:!dec mem e in
        if Set.mem pos ignore then
          Printf.sprintf
            "subgraph cluster_%d{style=filled;color=lightpink;\n%s}\n" pos str
        else if pos = currentpos || currentpos = -1 then
          Printf.sprintf
            "subgraph cluster_%d{style=filled;color=lightgrey;\n%s}\n" pos str
        else Printf.sprintf "subgraph x%d{\n%s}\n" pos str)
      t
    |> Array.fold_left ( ^ ) ""
  in
  "digraph{\n" ^ res ^ "\n}\n" |> Js.string

let rec find_next s pos max =
  if Set.cardinal s = max then -1
  else
    let next = (pos + 1) mod max in
    if Set.mem next s then find_next s next max else next

let _ =
  Js.export "myMathLib"
    (object%js
       method send s =
         let mem, t = Parsing_commands.parse_string (Js.to_string s) in
         x := (mem, Array.of_list t, Set.empty, 0)

       method get = [| to_dot (); to_str_mem () |] |> Js.array
       method setdec n = dec := n
       method setprecision p = precision := p
       method getprecision = !precision

       method next =
         let mem, l, ignore, pos = !x in
         if pos <> -1 then (
           (match !op with
           | UP ->
               let t = Tree.eval_bottom_top mem l.(pos) in
               l.(pos) <- t
           | DOWN ->
               let t = Tree.eval_top_bottom mem l.(pos) in
               l.(pos) <- t;
               let ignore =
                 if Constraints_eval.stop_condition ~precision:!precision mem
                 then Set.add pos ignore
                 else ignore
               in
               let next_pos = find_next ignore pos (Array.length l) in
               x := (mem, l, ignore, next_pos));
           next_op ();
           Js._false)
         else Js._true
    end)
