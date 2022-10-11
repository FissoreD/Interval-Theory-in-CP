open IntervalTheoryInCP

let () =
  Array.iter print_endline Sys.argv;
  let open Arg in
  let precision = ref 0.1 in
  let verbose = ref false in
  let print_tree = ref false in
  let dec = ref 3 in
  let file_path = ref "./ressources/input.txt" in
  let speclist =
    [
      ("-p", Set_float precision, "Set the precision of the constraints.");
      ( "-v",
        Set verbose,
        "Print each step of the algorithm execution in verbose mode." );
      ("-t", Set print_tree, "Print the tree at each step in prefix mode.");
      ("-d", Set_int dec, "Set the decimal precision in print mode");
      ( "-f",
        Set_string file_path,
        "Set the file path to read the input to parse." );
    ]
  in
  let usage_msg =
    "IntervalTheoryInCP is a tool allowing to test contraints over given \
     intervals\n\
     By default it parses the file placed in \"./ressources/input.txt\". This \
     file allow\n\
     you to have a template of how to write a program that will be parsed. \n\
     Options available:"
  in
  Arg.parse speclist print_endline usage_msg;
  let f = open_in !file_path in
  (try
     let mem, tree = Parsing_commands.parse_file f in
     print_endline "Varialbes : ";
     Memory.print ~dec:!dec mem;
     print_endline "";
     print_endline "The constraints are : ";
     List.iter
       (fun t ->
         Tree.print ~dec:!dec mem t;
         print_newline ())
       tree;
     print_endline "----------------------------------";
     print_endline "Program execution : ";
     Constraints_eval.constraint_inter ~dec:!dec ~print_tree:!print_tree
       ~verbose:!verbose ~precision:!precision (mem, tree);
     print_endline "The final vairable intervals are : ";
     Memory.print ~dec:!dec mem
   with e ->
     close_in f;
     raise e);
  close_in f;
  print_endline ""