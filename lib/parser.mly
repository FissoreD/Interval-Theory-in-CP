%{
  open Interval
  open Tree
  let mem = Hashtbl.create 2048
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
  | expr GEQ FLOAT   {Node ({l = $1; op = Geq; r = Leaf(Const $3); i = empty})}
  | expr LEQ FLOAT   {Node ({l = $1; op = Leq; r = Leaf(Const $3); i = empty})}
  | expr EQL FLOAT   {Node ({l = $1; op = Eql; r = Leaf(Const $3); i = empty})}

expr:
  | FLOAT           {Leaf (Const $1)}
  | VAR             {Leaf (Var $1)}
  | FLOAT VAR       {Node ({l = Leaf (Const $1); op = Mul; r = Leaf (Var $2); i = empty})}
  | expr MUL expr   {Node ({l = $1; op = Mul; r = $3; i = empty})}
  | expr DIV expr   {Node ({l = $1; op = Div; r = $3; i = empty})}
  | expr ADD expr   {Node ({l = $1; op = Add; r = $3; i = empty})}
  | expr SUB expr   {Node ({l = $1; op = Sub; r = $3; i = empty})}


var_interval:
  | VAR; FLOAT; FLOAT; var_interval { Hashtbl.add mem $1 (make_interval $2 $3) } 
  | SEP                             {  } 
  
