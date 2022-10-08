open IntervalTheoryInCP

let () = print_endline "Hello world"

let () =
  let f = open_in "./ressources/input.txt" in
  (try Parser.f Lexer.f (Lexing.from_channel f) |> List.iter Tree.print
   with e ->
     close_in f;
     raise e);
  close_in f;
  print_endline ""
