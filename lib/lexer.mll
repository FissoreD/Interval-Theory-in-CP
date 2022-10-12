{ 
  open Parser
}

let str = ['a' - 'z' 'A' - 'Z']+
let int = ['0' - '9']+
let float = '-'? (int '.' ['0' - '9']*) | (['0' - '9']* '.' int)
let sep = "%%"
let ign = [' ' '\t' '\r' ':' ',' '[' ']' '\n']+
let comment = "//" [^ '\n']*

rule f = parse
  | comment           
  | ign               { f lexbuf }
  | eof               { EOF }
  
  | str as c          { VAR (c) }
  | float as c        { FLOAT (float_of_string c) }
  | '-'? int as c     { FLOAT (float_of_string (c ^ ".")) }
  | sep               { SEP }

  | '*'               { MUL }
  | '/'               { DIV }
  | '+'               { ADD }
  | '-'               { SUB }
  | ">="              { GEQ }
  | "<="              { LEQ }
  | "="               { EQL }

  | '('               { LPAR }
  | ')'               { RPAR }
 