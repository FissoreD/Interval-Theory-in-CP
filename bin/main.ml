open IntervalTheoryInCP

let () =
  let f = open_in "./ressources/input.txt" in
  (try
     let mem, tree = Parsing_commands.parse_file f in
     List.iter
       (fun t ->
         Tree.print mem t;
         print_newline ())
       tree
   with e ->
     close_in f;
     raise e);
  close_in f;
  print_endline ""
