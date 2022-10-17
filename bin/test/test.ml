let _ =
  Interval_test.(
    test_interval_sum ();
    test_interval_sub ();
    test_interval_mul ();
    test_interval_div ());
  Tree_test.test_print ();
  Constraint_test.test_constraints ();
  Constraint_eval.test_constraints ();
  print_endline "";
  IntervalTheoryInCP.(
    let a, b = Parsing_commands.parse_string "a : [5, 20]\n%\na <= 6" in
    let t = List.hd b in
    Tree.print a (Tree.eval_bottom_top a t))
