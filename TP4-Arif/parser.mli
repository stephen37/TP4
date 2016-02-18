type token =
  | CONST_INT of (int)
  | CONST_UNIT
  | EOF
  | EOI
  | IDENT of (string)
  | LPAREN
  | MINUS
  | PLUS
  | PRINT_INT
  | PRINT_NEWLINE
  | RPAREN
  | SLASH
  | STAR
  | IF
  | THEN
  | ELSE
  | NOT
  | EQ
  | NEQ
  | LT
  | LE
  | GT
  | GE
  | AND
  | OR
  | UMINUS
  | TRUE
  | FALSE
  | LET
  | IN
  | AFFECT

val prog :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.prog
