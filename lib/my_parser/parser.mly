%{
  open Interval
  open Tree
%}

%token MUL, ADD, SUB, DIV, LEQ, GEQ, EQL, LPAR, RPAR
%token <string> VAR
%token <float> FLOAT
%token EOF, SEP

%left ADD SUB
%left MUL DIV

%start f
%type <Memory.t * tree list> f
%type <tree list> constr_list
%type <tree> constr
%type <Memory.mem_parser> interval_list

%%

f:
  interval_list; constr_list; EOF  { Memory.to_tbl $1, $2 }

constr_list: 
  | constr             {  [ $1 ] }
  | constr constr_list { $1 :: $2 }

constr: 
  | expr GEQ FLOAT   { BinNode {l = $1; op = Geq; r = Leaf(Const $3); i = empty }}
  | expr LEQ FLOAT   { BinNode {l = $1; op = Leq; r = Leaf(Const $3); i = empty }}
  | expr EQL FLOAT   { BinNode {l = $1; op = Eql; r = Leaf(Const $3); i = empty }}

expr:
  | FLOAT           { Leaf (Const $1)}
  | VAR             { Leaf (Var $1)}
  | FLOAT VAR       { BinNode {l = Leaf (Const $1); op = Mul; r = Leaf (Var $2); i = empty}}
  | expr MUL expr   { BinNode {l = $1; op = Mul; r = $3; i = empty}}
  | expr DIV expr   { BinNode {l = $1; op = Div; r = $3; i = empty}}
  | expr ADD expr   { BinNode {l = $1; op = Add; r = $3; i = empty}}
  | expr SUB expr   { BinNode {l = $1; op = Sub; r = $3; i = empty}}
  | LPAR expr RPAR  { $2 }
  | SUB expr        {  UnaryNode {opu = Sub; c = $2; iu = empty }}


interval_list:
  | VAR; FLOAT; FLOAT; interval_list { ($1, (make_interval $2 $3)) :: $4 } 
  | SEP                              {  [] } 
  
