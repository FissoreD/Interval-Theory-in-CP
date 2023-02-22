open IntervalTheoryInCP

let test1 =
  Parsing_commands.parse_string
    "x : [-2, 5]\ny : [-3, 3]\n%%\n  x - 2y <= 2\nx + 2y <= 2"

let test2 =
  Parsing_commands.parse_string
    "x : [0, 8]\ny : [-1, 3]\n%%x + 4y = 8\nx + 2y = 6"

let test_constraints () =
  let mem, _ = test1 in
  Constraints_eval.constraint_inter test1;
  Memory.print mem;
  print_endline "";
  let mem, _ = test2 in
  Constraints_eval.constraint_inter test2;
  Memory.print ~dec:4 mem
