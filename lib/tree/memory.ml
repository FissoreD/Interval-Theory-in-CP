type mem_parser = (string * Interval.t) list
type memory_cell = { mutable old : Interval.t; mutable current : Interval.t }
type t = (string, memory_cell) Hashtbl.t

let update cell new_value =
  cell.old <- cell.current;
  cell.current <- new_value

let empty_memory (mem : t) =
  Hashtbl.iter (fun _ v -> v.current <- Interval.empty) mem

let to_tbl (m : mem_parser) : t =
  let res = Hashtbl.create 2048 in
  List.iter (fun (k, v) -> Hashtbl.replace res k { old = v; current = v }) m;
  res

let to_string ?(dec = 3) (m : t) =
  Hashtbl.fold
    (fun k { current; _ } acc ->
      acc ^ k ^ ":" ^ Interval.to_string ~dec current ^ "; ")
    m ""

let print ?(dec = 3) (m : t) = print_string @@ to_string ~dec m
