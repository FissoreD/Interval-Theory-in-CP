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
%type <tree list> f constr_list
%type <tree> constr
// %type <(string * Interval.t) list> var_interval

%%

f:
  var_interval; SEP; constr_list; EOF  { $3 }

constr_list: 
  | constr             { [ $1 ] }
  | constr constr_list { $1 :: $2 }

constr: 
  | expr GEQ FLOAT   {Node ({l = $1; op = Geq; r = Leaf(make_interval $3 $3); i = empty})}
  | expr LEQ FLOAT   {Node ({l = $1; op = Leq; r = Leaf(make_interval $3 $3); i = empty})}
  | expr EQL FLOAT   {Node ({l = $1; op = Eql; r = Leaf(make_interval $3 $3); i = empty})}

expr:
  | FLOAT           {Leaf (make_interval $1 $1)}
  | VAR             {Leaf (Hashtbl.find mem $1)}
  | expr MUL expr   {Node ({l = $1; op = Mul; r = $3; i = empty})}
  | expr DIV expr   {Node ({l = $1; op = Div; r = $3; i = empty})}
  | expr ADD expr   {Node ({l = $1; op = Add; r = $3; i = empty})}
  | expr SUB expr   {Node ({l = $1; op = Sub; r = $3; i = empty})}


var_interval:
  | VAR; FLOAT; FLOAT; var_interval { Hashtbl.add mem $1 (make_interval $2 $3) } 
  | VAR; FLOAT; FLOAT;              { Hashtbl.add mem $1 (make_interval $2 $3) } 
  
