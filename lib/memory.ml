type mem_parser = (string * Interval.t) list
type memory_cell = { mutable old : Interval.t; mutable current : Interval.t }
type t = (string, memory_cell) Hashtbl.t

let update cell new_value =
  cell.old <- cell.current;
  cell.current <- new_value

let to_tbl (m : mem_parser) : t =
  let res = Hashtbl.create 2048 in
  List.iter (fun (k, v) -> Hashtbl.replace res k { old = v; current = v }) m;
  res

let print ?(dec = 3) (m : t) =
  Hashtbl.iter
    (fun k { current; _ } ->
      print_string k;
      Interval.print ~dec current;
      print_string " ")
    m
