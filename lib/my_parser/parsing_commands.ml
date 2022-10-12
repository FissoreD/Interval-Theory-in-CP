let parse_string s = Parser.f Lexer.f (Lexing.from_string s)
let parse_file f = Parser.f Lexer.f (Lexing.from_channel f)