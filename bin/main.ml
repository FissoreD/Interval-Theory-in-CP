open IntervalTheoryInCP

let () = print_endline "Hello world"

let () =
  let f = open_in "./ressources/input.txt" in
  (try
     let mem, tree = Parser.f Lexer.f (Lexing.from_channel f) in
     List.iter (Tree.print mem) tree
   with e ->
     close_in f;
     raise e);
  close_in f;
  print_endline ""
