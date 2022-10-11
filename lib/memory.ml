type mem_parser = (string * Interval.t) list
type t = (string, Interval.t) Hashtbl.t

let to_tbl (m : mem_parser) : t =
  let res = Hashtbl.create 2048 in
  List.iter (fun (k, v) -> Hashtbl.replace res k v) m;
  res

let print ?(dec = 0) (m : t) =
  Hashtbl.iter
    (fun k v ->
      print_string k;
      Interval.print ~dec v;
      print_string " ")
    m
