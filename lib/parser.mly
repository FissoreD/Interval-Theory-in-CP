%{
  open Interval
  open Tree
  open Operator
  let mem = Hashtbl.create 2048

  let calc_interval op t1 t2 = 
    let a, b = get_interval mem (t1, t2) in 
    (op_to_fun op) a b
%}

%token MUL, ADD, SUB, DIV, LEQ, GEQ, EQL 
%token <string> VAR
%token <float> FLOAT
%token EOF, SEP

%left ADD SUB
%left MUL DIV

%start f
%type <(string, Interval.t) Hashtbl.t * tree list> f
%type <tree list> constr_list
%type <tree> constr

%%

f:
  var_interval; constr_list; EOF  { mem, $2 }

constr_list: 
  | constr             { [ $1 ] }
  | constr constr_list { $1 :: $2 }

constr: 
  | expr GEQ FLOAT   {Node {l = $1; op = Geq; r = Leaf(Const $3); i = calc_interval Geq $1 (Leaf(Const $3)) }}
  | expr LEQ FLOAT   {Node {l = $1; op = Leq; r = Leaf(Const $3); i = calc_interval Leq $1 (Leaf(Const $3)) }}
  | expr EQL FLOAT   {Node {l = $1; op = Eql; r = Leaf(Const $3); i = calc_interval Eql $1 (Leaf(Const $3)) }}

expr:
  | FLOAT           {Leaf (Const $1)}
  | VAR             {Leaf (Var $1)}
  | FLOAT VAR       {Node {l = Leaf (Const $1); op = Mul; r = Leaf (Var $2); i = calc_interval Mul (Leaf(Const $1)) (Leaf (Var $2)) }}
  | expr MUL expr   {Node {l = $1; op = Mul; r = $3; i = calc_interval Mul $1 $3}}
  | expr DIV expr   {Node {l = $1; op = Div; r = $3; i = calc_interval Div $1 $3}}
  | expr ADD expr   {Node {l = $1; op = Add; r = $3; i = calc_interval Add $1 $3}}
  | expr SUB expr   {Node {l = $1; op = Sub; r = $3; i = calc_interval Sub $1 $3}}


var_interval:
  | VAR; FLOAT; FLOAT; var_interval { Hashtbl.add mem $1 (make_interval $2 $3) } 
  | SEP                             {  } 
  
