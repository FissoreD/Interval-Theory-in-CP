
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VAR of (
# 7 "lib/my_parser/parser.mly"
       (string)
# 15 "lib/my_parser/parser.ml"
  )
    | SUB
    | SEP
    | RPAR
    | MUL
    | LPAR
    | LEQ
    | GEQ
    | FLOAT of (
# 8 "lib/my_parser/parser.mly"
       (float)
# 27 "lib/my_parser/parser.ml"
  )
    | EQL
    | EOF
    | DIV
    | ADD
  
end

include MenhirBasics

# 1 "lib/my_parser/parser.mly"
  
  open Interval
  open Tree

# 43 "lib/my_parser/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_f) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: f. *)

  | MenhirState03 : (('s, _menhir_box_f) _menhir_cell1_VAR _menhir_cell0_FLOAT _menhir_cell0_FLOAT, _menhir_box_f) _menhir_state
    (** State 03.
        Stack shape : VAR FLOAT FLOAT.
        Start symbol: f. *)

  | MenhirState06 : (('s, _menhir_box_f) _menhir_cell1_interval_list, _menhir_box_f) _menhir_state
    (** State 06.
        Stack shape : interval_list.
        Start symbol: f. *)

  | MenhirState08 : (('s, _menhir_box_f) _menhir_cell1_SUB, _menhir_box_f) _menhir_state
    (** State 08.
        Stack shape : SUB.
        Start symbol: f. *)

  | MenhirState09 : (('s, _menhir_box_f) _menhir_cell1_LPAR, _menhir_box_f) _menhir_state
    (** State 09.
        Stack shape : LPAR.
        Start symbol: f. *)

  | MenhirState13 : (('s, _menhir_box_f) _menhir_cell1_expr, _menhir_box_f) _menhir_state
    (** State 13.
        Stack shape : expr.
        Start symbol: f. *)

  | MenhirState15 : (('s, _menhir_box_f) _menhir_cell1_expr, _menhir_box_f) _menhir_state
    (** State 15.
        Stack shape : expr.
        Start symbol: f. *)

  | MenhirState17 : (('s, _menhir_box_f) _menhir_cell1_expr, _menhir_box_f) _menhir_state
    (** State 17.
        Stack shape : expr.
        Start symbol: f. *)

  | MenhirState20 : (('s, _menhir_box_f) _menhir_cell1_expr, _menhir_box_f) _menhir_state
    (** State 20.
        Stack shape : expr.
        Start symbol: f. *)

  | MenhirState32 : (('s, _menhir_box_f) _menhir_cell1_constr, _menhir_box_f) _menhir_state
    (** State 32.
        Stack shape : constr.
        Start symbol: f. *)


and ('s, 'r) _menhir_cell1_constr = 
  | MenhirCell1_constr of 's * ('s, 'r) _menhir_state * (Tree.tree)

and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Tree.tree)

and ('s, 'r) _menhir_cell1_interval_list = 
  | MenhirCell1_interval_list of 's * ('s, 'r) _menhir_state * (Memory.mem_parser)

and 's _menhir_cell0_FLOAT = 
  | MenhirCell0_FLOAT of 's * (
# 8 "lib/my_parser/parser.mly"
       (float)
# 110 "lib/my_parser/parser.ml"
)

and ('s, 'r) _menhir_cell1_LPAR = 
  | MenhirCell1_LPAR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SUB = 
  | MenhirCell1_SUB of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VAR = 
  | MenhirCell1_VAR of 's * ('s, 'r) _menhir_state * (
# 7 "lib/my_parser/parser.mly"
       (string)
# 123 "lib/my_parser/parser.ml"
)

and _menhir_box_f = 
  | MenhirBox_f of (Memory.t * Tree.tree list) [@@unboxed]

let _menhir_action_01 =
  fun _1 _3 ->
    (
# 30 "lib/my_parser/parser.mly"
                     ( BinNode {l = _1; op = Geq; r = Leaf(Const _3); i = empty })
# 134 "lib/my_parser/parser.ml"
     : (Tree.tree))

let _menhir_action_02 =
  fun _1 _3 ->
    (
# 31 "lib/my_parser/parser.mly"
                     ( BinNode {l = _1; op = Leq; r = Leaf(Const _3); i = empty })
# 142 "lib/my_parser/parser.ml"
     : (Tree.tree))

let _menhir_action_03 =
  fun _1 _3 ->
    (
# 32 "lib/my_parser/parser.mly"
                     ( BinNode {l = _1; op = Eql; r = Leaf(Const _3); i = empty })
# 150 "lib/my_parser/parser.ml"
     : (Tree.tree))

let _menhir_action_04 =
  fun _1 ->
    (
# 26 "lib/my_parser/parser.mly"
                       (  [ _1 ] )
# 158 "lib/my_parser/parser.ml"
     : (Tree.tree list))

let _menhir_action_05 =
  fun _1 _2 ->
    (
# 27 "lib/my_parser/parser.mly"
                       ( _1 :: _2 )
# 166 "lib/my_parser/parser.ml"
     : (Tree.tree list))

let _menhir_action_06 =
  fun _1 ->
    (
# 35 "lib/my_parser/parser.mly"
                    ( Leaf (Const _1))
# 174 "lib/my_parser/parser.ml"
     : (Tree.tree))

let _menhir_action_07 =
  fun _1 ->
    (
# 36 "lib/my_parser/parser.mly"
                    ( Leaf (Var _1))
# 182 "lib/my_parser/parser.ml"
     : (Tree.tree))

let _menhir_action_08 =
  fun _1 _2 ->
    (
# 37 "lib/my_parser/parser.mly"
                    ( BinNode {l = Leaf (Const _1); op = Mul; r = Leaf (Var _2); i = empty})
# 190 "lib/my_parser/parser.ml"
     : (Tree.tree))

let _menhir_action_09 =
  fun _1 _3 ->
    (
# 38 "lib/my_parser/parser.mly"
                    ( BinNode {l = _1; op = Mul; r = _3; i = empty})
# 198 "lib/my_parser/parser.ml"
     : (Tree.tree))

let _menhir_action_10 =
  fun _1 _3 ->
    (
# 39 "lib/my_parser/parser.mly"
                    ( BinNode {l = _1; op = Div; r = _3; i = empty})
# 206 "lib/my_parser/parser.ml"
     : (Tree.tree))

let _menhir_action_11 =
  fun _1 _3 ->
    (
# 40 "lib/my_parser/parser.mly"
                    ( BinNode {l = _1; op = Add; r = _3; i = empty})
# 214 "lib/my_parser/parser.ml"
     : (Tree.tree))

let _menhir_action_12 =
  fun _1 _3 ->
    (
# 41 "lib/my_parser/parser.mly"
                    ( BinNode {l = _1; op = Sub; r = _3; i = empty})
# 222 "lib/my_parser/parser.ml"
     : (Tree.tree))

let _menhir_action_13 =
  fun _2 ->
    (
# 42 "lib/my_parser/parser.mly"
                    ( _2 )
# 230 "lib/my_parser/parser.ml"
     : (Tree.tree))

let _menhir_action_14 =
  fun _2 ->
    (
# 43 "lib/my_parser/parser.mly"
                    (  UnaryNode {opu = Sub; c = _2; iu = empty })
# 238 "lib/my_parser/parser.ml"
     : (Tree.tree))

let _menhir_action_15 =
  fun _1 _2 ->
    (
# 23 "lib/my_parser/parser.mly"
                                   ( Memory.to_tbl _1, _2 )
# 246 "lib/my_parser/parser.ml"
     : (Memory.t * Tree.tree list))

let _menhir_action_16 =
  fun _1 _2 _3 _4 ->
    (
# 47 "lib/my_parser/parser.mly"
                                     ( (_1, (make_interval _2 _3)) :: _4 )
# 254 "lib/my_parser/parser.ml"
     : (Memory.mem_parser))

let _menhir_action_17 =
  fun () ->
    (
# 48 "lib/my_parser/parser.mly"
                                     (  [] )
# 262 "lib/my_parser/parser.ml"
     : (Memory.mem_parser))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ADD ->
        "ADD"
    | DIV ->
        "DIV"
    | EOF ->
        "EOF"
    | EQL ->
        "EQL"
    | FLOAT _ ->
        "FLOAT"
    | GEQ ->
        "GEQ"
    | LEQ ->
        "LEQ"
    | LPAR ->
        "LPAR"
    | MUL ->
        "MUL"
    | RPAR ->
        "RPAR"
    | SEP ->
        "SEP"
    | SUB ->
        "SUB"
    | VAR _ ->
        "VAR"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_30 : type  ttv_stack. (ttv_stack, _menhir_box_f) _menhir_cell1_interval_list -> _ -> _menhir_box_f =
    fun _menhir_stack _v ->
      let MenhirCell1_interval_list (_menhir_stack, _, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_15 _1 _2 in
      MenhirBox_f _v
  
  let rec _menhir_goto_constr_list : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _menhir_box_f =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState32 ->
          _menhir_run_33 _menhir_stack _v
      | MenhirState06 ->
          _menhir_run_30 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_33 : type  ttv_stack. (ttv_stack, _menhir_box_f) _menhir_cell1_constr -> _ -> _menhir_box_f =
    fun _menhir_stack _v ->
      let MenhirCell1_constr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_05 _1 _2 in
      _menhir_goto_constr_list _menhir_stack _v _menhir_s
  
  let rec _menhir_run_23 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | FLOAT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_1, _3) = (_v, _v_0) in
              let _v = _menhir_action_02 _1 _3 in
              _menhir_goto_constr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | GEQ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | FLOAT _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_1, _3) = (_v, _v_1) in
              let _v = _menhir_action_01 _1 _3 in
              _menhir_goto_constr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | EQL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | FLOAT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_1, _3) = (_v, _v_2) in
              let _v = _menhir_action_03 _1 _3 in
              _menhir_goto_constr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | DIV ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. (ttv_stack, _menhir_box_f) _menhir_cell1_expr -> _ -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_07 _1 in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
      | SUB ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | LPAR ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | FLOAT _v ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ((ttv_stack, _menhir_box_f) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_f) _menhir_state -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | EQL | GEQ | LEQ | RPAR | SUB ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_12 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_f) _menhir_cell1_expr -> _ -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_07 _1 in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SUB ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | LPAR ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | FLOAT _v ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. (ttv_stack, _menhir_box_f) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_09 _1 _3 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState32 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState06 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState08 ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState15 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState13 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_22 : type  ttv_stack. ((ttv_stack, _menhir_box_f) _menhir_cell1_SUB as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_f) _menhir_state -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | EQL | GEQ | LEQ | RPAR | SUB ->
          let MenhirCell1_SUB (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_14 _2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. (ttv_stack, _menhir_box_f) _menhir_cell1_expr -> _ -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_07 _1 in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SUB ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | LPAR ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | FLOAT _v ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. (ttv_stack, _menhir_box_f) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_10 _1 _3 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_SUB (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_07 _1 in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08 _tok
      | SUB ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | LPAR ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | FLOAT _v ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_07 _1 in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
      | SUB ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | LPAR ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | FLOAT _v ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09
      | _ ->
          _eRR ()
  
  and _menhir_run_12 : type  ttv_stack. ((ttv_stack, _menhir_box_f) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_f) _menhir_state -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_13 _2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MUL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. (ttv_stack, _menhir_box_f) _menhir_cell1_expr -> _ -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_07 _1 in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20 _tok
      | SUB ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | LPAR ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | FLOAT _v ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20
      | _ ->
          _eRR ()
  
  and _menhir_run_21 : type  ttv_stack. ((ttv_stack, _menhir_box_f) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_f) _menhir_state -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | EQL | GEQ | LEQ | RPAR | SUB ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_11 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_1, _2) = (_v, _v_0) in
          let _v = _menhir_action_08 _1 _2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | ADD | DIV | EQL | GEQ | LEQ | MUL | RPAR | SUB ->
          let _1 = _v in
          let _v = _menhir_action_06 _1 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_constr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          let _menhir_stack = MenhirCell1_constr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_0 in
          let _v = _menhir_action_07 _1 in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32 _tok
      | SUB ->
          let _menhir_stack = MenhirCell1_constr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | LPAR ->
          let _menhir_stack = MenhirCell1_constr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | FLOAT _v_2 ->
          let _menhir_stack = MenhirCell1_constr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState32
      | EOF ->
          let _1 = _v in
          let _v = _menhir_action_04 _1 in
          _menhir_goto_constr_list _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  let rec _menhir_run_06 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_interval_list (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_0 in
          let _v = _menhir_action_07 _1 in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
      | SUB ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | LPAR ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | FLOAT _v_2 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState06
      | _ ->
          _eRR ()
  
  let rec _menhir_run_05 : type  ttv_stack. (ttv_stack, _menhir_box_f) _menhir_cell1_VAR _menhir_cell0_FLOAT _menhir_cell0_FLOAT -> _ -> _ -> _ -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_FLOAT (_menhir_stack, _3) = _menhir_stack in
      let MenhirCell0_FLOAT (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_VAR (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _4 = _v in
      let _v = _menhir_action_16 _1 _2 _3 _4 in
      _menhir_goto_interval_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_interval_list : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState03 ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | FLOAT _v_0 ->
          let _menhir_stack = MenhirCell0_FLOAT (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | FLOAT _v_1 ->
              let _menhir_stack = MenhirCell0_FLOAT (_menhir_stack, _v_1) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | VAR _v_2 ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState03
              | SEP ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_17 () in
                  _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | SEP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | _ ->
          _eRR ()
  
end

let f =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_f v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
