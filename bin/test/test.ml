let _ =
  Interval_test.(
    test_interval_sum ();
    test_interval_sub ();
    test_interval_mul ();
    test_interval_div ());
  Tree_test.test_print ();
  Constraint_eval.test_constraints ()
