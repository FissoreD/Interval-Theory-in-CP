
(* The type of tokens. *)

type token = 
  | VAR of (string)
  | SUB
  | SEP
  | RPAR
  | MUL
  | LPAR
  | LEQ
  | GEQ
  | FLOAT of (float)
  | EQL
  | EOF
  | DIV
  | ADD

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val f: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Memory.t * Tree.tree list)
