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

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"

  open Ast

  (* Fonction pour aider à la localisation des erreurs. *)
  let current_pos () =
    Parsing.symbol_start_pos (),
    Parsing.symbol_end_pos ()

  (* Fonction de construction d'un [node_expr], qui renseigne correctement
     la localisation de l'expression. *)
  let mk_node e = { expr = e; pos = current_pos() }

# 47 "parser.ml"
let yytransl_const = [|
  258 (* CONST_UNIT *);
    0 (* EOF *);
  259 (* EOI *);
  261 (* LPAREN *);
  262 (* MINUS *);
  263 (* PLUS *);
  264 (* PRINT_INT *);
  265 (* PRINT_NEWLINE *);
  266 (* RPAREN *);
  267 (* SLASH *);
  268 (* STAR *);
  269 (* IF *);
  270 (* THEN *);
  271 (* ELSE *);
  272 (* NOT *);
  273 (* EQ *);
  274 (* NEQ *);
  275 (* LT *);
  276 (* LE *);
  277 (* GT *);
  278 (* GE *);
  279 (* AND *);
  280 (* OR *);
  281 (* UMINUS *);
  282 (* TRUE *);
  283 (* FALSE *);
    0|]

let yytransl_block = [|
  257 (* CONST_INT *);
  260 (* IDENT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\003\000\004\000\004\000\004\000\005\000\
\005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
\005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
\005\000\005\000\005\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\001\000\002\000\002\000\001\000\
\001\000\001\000\001\000\003\000\002\000\003\000\003\000\003\000\
\003\000\002\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\006\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\009\000\008\000\000\000\000\000\000\000\000\000\
\000\000\000\000\010\000\011\000\028\000\000\000\000\000\000\000\
\005\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\001\000\003\000\004\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\012\000\
\000\000\000\000\000\000\017\000\016\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yydgoto = "\002\000\
\013\000\014\000\015\000\016\000\017\000"

let yysindex = "\009\000\
\036\255\000\000\000\000\000\000\036\255\036\255\036\255\036\255\
\036\255\036\255\000\000\000\000\000\000\035\000\036\255\164\255\
\000\000\088\000\004\255\145\000\000\000\000\000\107\000\002\255\
\000\000\000\000\000\000\036\255\036\255\036\255\036\255\036\255\
\036\255\036\255\036\255\036\255\036\255\036\255\036\255\000\000\
\036\255\004\255\004\255\000\000\000\000\164\000\164\000\002\255\
\002\255\002\255\002\255\000\255\000\255\126\000\036\255\145\000"

let yyrindex = "\000\000\
\043\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\043\000\000\000\
\000\000\000\000\098\255\000\000\054\255\076\255\000\000\186\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\120\255\142\255\000\000\000\000\040\000\056\000\208\255\
\230\255\252\255\018\000\062\000\078\000\000\000\000\000\044\255"

let yygindex = "\000\000\
\000\000\031\000\000\000\251\255\032\000"

let yytablesize = 442
let yytable = "\018\000\
\019\000\020\000\020\000\023\000\024\000\028\000\029\000\028\000\
\029\000\001\000\030\000\031\000\030\000\031\000\030\000\031\000\
\032\000\033\000\034\000\035\000\036\000\037\000\042\000\043\000\
\044\000\045\000\046\000\047\000\048\000\049\000\050\000\051\000\
\052\000\053\000\025\000\054\000\003\000\004\000\021\000\022\000\
\005\000\006\000\002\000\007\000\008\000\026\000\027\000\000\000\
\009\000\056\000\000\000\010\000\000\000\027\000\000\000\000\000\
\007\000\027\000\027\000\005\000\005\000\011\000\012\000\007\000\
\005\000\005\000\000\000\007\000\007\000\000\000\005\000\005\000\
\005\000\005\000\005\000\005\000\005\000\005\000\006\000\000\000\
\000\000\005\000\005\000\000\000\000\000\006\000\005\000\005\000\
\000\000\006\000\006\000\000\000\005\000\005\000\005\000\005\000\
\005\000\005\000\005\000\005\000\013\000\000\000\000\000\013\000\
\013\000\000\000\000\000\013\000\000\000\000\000\000\000\013\000\
\013\000\000\000\013\000\013\000\013\000\013\000\013\000\013\000\
\013\000\013\000\015\000\000\000\000\000\015\000\015\000\000\000\
\000\000\015\000\000\000\000\000\000\000\015\000\015\000\000\000\
\015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
\014\000\000\000\000\000\014\000\014\000\000\000\000\000\014\000\
\000\000\000\000\000\000\014\000\014\000\000\000\014\000\014\000\
\014\000\014\000\014\000\014\000\014\000\014\000\027\000\000\000\
\000\000\028\000\029\000\000\000\000\000\000\000\030\000\031\000\
\000\000\000\000\000\000\000\000\032\000\033\000\034\000\035\000\
\036\000\037\000\038\000\039\000\018\000\000\000\000\000\000\000\
\000\000\000\000\000\000\018\000\000\000\000\000\000\000\018\000\
\018\000\000\000\018\000\018\000\018\000\018\000\018\000\018\000\
\018\000\018\000\021\000\000\000\000\000\000\000\000\000\000\000\
\000\000\021\000\000\000\000\000\000\000\021\000\021\000\000\000\
\021\000\021\000\021\000\021\000\021\000\021\000\021\000\021\000\
\022\000\000\000\000\000\000\000\000\000\000\000\000\000\022\000\
\000\000\000\000\000\000\022\000\022\000\000\000\022\000\022\000\
\022\000\022\000\022\000\022\000\022\000\022\000\023\000\000\000\
\000\000\000\000\000\000\000\000\000\000\023\000\000\000\000\000\
\000\000\023\000\023\000\000\000\023\000\023\000\023\000\023\000\
\023\000\023\000\023\000\023\000\024\000\000\000\000\000\000\000\
\000\000\000\000\000\000\024\000\000\000\000\000\000\000\024\000\
\024\000\000\000\024\000\024\000\024\000\024\000\024\000\024\000\
\024\000\024\000\019\000\000\000\000\000\000\000\000\000\000\000\
\000\000\019\000\000\000\000\000\000\000\019\000\019\000\000\000\
\019\000\019\000\020\000\000\000\000\000\000\000\019\000\019\000\
\025\000\020\000\000\000\000\000\000\000\020\000\020\000\025\000\
\020\000\020\000\000\000\025\000\025\000\000\000\020\000\020\000\
\026\000\000\000\000\000\000\000\025\000\025\000\000\000\026\000\
\000\000\000\000\000\000\026\000\026\000\028\000\029\000\000\000\
\000\000\040\000\030\000\031\000\026\000\026\000\000\000\000\000\
\032\000\033\000\034\000\035\000\036\000\037\000\038\000\039\000\
\028\000\029\000\000\000\000\000\000\000\030\000\031\000\000\000\
\041\000\000\000\000\000\032\000\033\000\034\000\035\000\036\000\
\037\000\038\000\039\000\028\000\029\000\000\000\000\000\000\000\
\030\000\031\000\000\000\000\000\055\000\000\000\032\000\033\000\
\034\000\035\000\036\000\037\000\038\000\039\000\028\000\029\000\
\000\000\000\000\000\000\030\000\031\000\000\000\000\000\000\000\
\000\000\032\000\033\000\034\000\035\000\036\000\037\000\038\000\
\039\000\028\000\029\000\000\000\000\000\000\000\030\000\031\000\
\000\000\000\000\000\000\000\000\000\000\000\000\034\000\035\000\
\036\000\037\000"

let yycheck = "\005\000\
\006\000\007\000\008\000\009\000\010\000\006\001\007\001\006\001\
\007\001\001\000\011\001\012\001\011\001\012\001\011\001\012\001\
\017\001\018\001\019\001\020\001\021\001\022\001\028\000\029\000\
\030\000\031\000\032\000\033\000\034\000\035\000\036\000\037\000\
\038\000\039\000\000\000\041\000\001\001\002\001\007\000\008\000\
\005\001\006\001\000\000\008\001\009\001\015\000\003\001\255\255\
\013\001\055\000\255\255\016\001\255\255\010\001\255\255\255\255\
\003\001\014\001\015\001\006\001\007\001\026\001\027\001\010\001\
\011\001\012\001\255\255\014\001\015\001\255\255\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\003\001\255\255\
\255\255\006\001\007\001\255\255\255\255\010\001\011\001\012\001\
\255\255\014\001\015\001\255\255\017\001\018\001\019\001\020\001\
\021\001\022\001\023\001\024\001\003\001\255\255\255\255\006\001\
\007\001\255\255\255\255\010\001\255\255\255\255\255\255\014\001\
\015\001\255\255\017\001\018\001\019\001\020\001\021\001\022\001\
\023\001\024\001\003\001\255\255\255\255\006\001\007\001\255\255\
\255\255\010\001\255\255\255\255\255\255\014\001\015\001\255\255\
\017\001\018\001\019\001\020\001\021\001\022\001\023\001\024\001\
\003\001\255\255\255\255\006\001\007\001\255\255\255\255\010\001\
\255\255\255\255\255\255\014\001\015\001\255\255\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\003\001\255\255\
\255\255\006\001\007\001\255\255\255\255\255\255\011\001\012\001\
\255\255\255\255\255\255\255\255\017\001\018\001\019\001\020\001\
\021\001\022\001\023\001\024\001\003\001\255\255\255\255\255\255\
\255\255\255\255\255\255\010\001\255\255\255\255\255\255\014\001\
\015\001\255\255\017\001\018\001\019\001\020\001\021\001\022\001\
\023\001\024\001\003\001\255\255\255\255\255\255\255\255\255\255\
\255\255\010\001\255\255\255\255\255\255\014\001\015\001\255\255\
\017\001\018\001\019\001\020\001\021\001\022\001\023\001\024\001\
\003\001\255\255\255\255\255\255\255\255\255\255\255\255\010\001\
\255\255\255\255\255\255\014\001\015\001\255\255\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\003\001\255\255\
\255\255\255\255\255\255\255\255\255\255\010\001\255\255\255\255\
\255\255\014\001\015\001\255\255\017\001\018\001\019\001\020\001\
\021\001\022\001\023\001\024\001\003\001\255\255\255\255\255\255\
\255\255\255\255\255\255\010\001\255\255\255\255\255\255\014\001\
\015\001\255\255\017\001\018\001\019\001\020\001\021\001\022\001\
\023\001\024\001\003\001\255\255\255\255\255\255\255\255\255\255\
\255\255\010\001\255\255\255\255\255\255\014\001\015\001\255\255\
\017\001\018\001\003\001\255\255\255\255\255\255\023\001\024\001\
\003\001\010\001\255\255\255\255\255\255\014\001\015\001\010\001\
\017\001\018\001\255\255\014\001\015\001\255\255\023\001\024\001\
\003\001\255\255\255\255\255\255\023\001\024\001\255\255\010\001\
\255\255\255\255\255\255\014\001\015\001\006\001\007\001\255\255\
\255\255\010\001\011\001\012\001\023\001\024\001\255\255\255\255\
\017\001\018\001\019\001\020\001\021\001\022\001\023\001\024\001\
\006\001\007\001\255\255\255\255\255\255\011\001\012\001\255\255\
\014\001\255\255\255\255\017\001\018\001\019\001\020\001\021\001\
\022\001\023\001\024\001\006\001\007\001\255\255\255\255\255\255\
\011\001\012\001\255\255\255\255\015\001\255\255\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\006\001\007\001\
\255\255\255\255\255\255\011\001\012\001\255\255\255\255\255\255\
\255\255\017\001\018\001\019\001\020\001\021\001\022\001\023\001\
\024\001\006\001\007\001\255\255\255\255\255\255\011\001\012\001\
\255\255\255\255\255\255\255\255\255\255\255\255\019\001\020\001\
\021\001\022\001"

let yynames_const = "\
  CONST_UNIT\000\
  EOF\000\
  EOI\000\
  LPAREN\000\
  MINUS\000\
  PLUS\000\
  PRINT_INT\000\
  PRINT_NEWLINE\000\
  RPAREN\000\
  SLASH\000\
  STAR\000\
  IF\000\
  THEN\000\
  ELSE\000\
  NOT\000\
  EQ\000\
  NEQ\000\
  LT\000\
  LE\000\
  GT\000\
  GE\000\
  AND\000\
  OR\000\
  UMINUS\000\
  TRUE\000\
  FALSE\000\
  "

let yynames_block = "\
  CONST_INT\000\
  IDENT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'instr_seq) in
    Obj.repr(
# 85 "parser.mly"
                ( _1 )
# 285 "parser.ml"
               : Ast.prog))
; (fun __caml_parser_env ->
    Obj.repr(
# 90 "parser.mly"
    ( [] )
# 291 "parser.ml"
               : 'instr_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'instr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'instr_seq) in
    Obj.repr(
# 92 "parser.mly"
    ( _1 :: _2 )
# 299 "parser.ml"
               : 'instr_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 100 "parser.mly"
    ( Icompute _1 )
# 306 "parser.ml"
               : 'instr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 119 "parser.mly"
    ( _1 )
# 313 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 121 "parser.mly"
    ( mk_node (Eprint_newline _2) )
# 320 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 126 "parser.mly"
    ( mk_node (Eprint_int _2) )
# 327 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 135 "parser.mly"
    ( mk_node (Econst Cunit) )
# 333 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 140 "parser.mly"
( mk_node (Econst (Cint _1)) )
# 340 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 143 "parser.mly"
( mk_node (Econst (Cbool true)) )
# 346 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 145 "parser.mly"
( mk_node (Econst (Cbool false)) )
# 352 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 148 "parser.mly"
( _2 )
# 359 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 151 "parser.mly"
( mk_node (Eunop (Uminus, _2)) )
# 366 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 154 "parser.mly"
( mk_node (Ebinop (Badd, _1, _3)) )
# 374 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 157 "parser.mly"
( mk_node (Ebinop (Bsub, _1, _3)) )
# 382 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 160 "parser.mly"
( mk_node (Ebinop (Bmul, _1, _3)) )
# 390 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 163 "parser.mly"
( mk_node (Ebinop (Bdiv, _1, _3)) )
# 398 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 167 "parser.mly"
    ( mk_node (Eunop (Unot, _2)) )
# 405 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 170 "parser.mly"
    ( mk_node (Ebinop (Beq, _1, _3)) )
# 413 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 173 "parser.mly"
    ( mk_node (Ebinop (Bneq, _1, _3)) )
# 421 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 176 "parser.mly"
    ( mk_node (Ebinop (Blt, _1, _3)) )
# 429 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 179 "parser.mly"
    ( mk_node (Ebinop (Ble, _1, _3)) )
# 437 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 182 "parser.mly"
    ( mk_node (Ebinop (Bgt, _1, _3)) )
# 445 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 185 "parser.mly"
    ( mk_node (Ebinop (Bge, _1, _3)) )
# 453 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 188 "parser.mly"
    ( mk_node (Ebinop (Band, _1, _3)) )
# 461 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 191 "parser.mly"
    ( mk_node (Ebinop (Bor, _1, _3)) )
# 469 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 194 "parser.mly"
    ( mk_node (Eif (_2, _4, _6)) )
# 478 "parser.ml"
               : 'simple_expr))
(* Entry prog *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let prog (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.prog)
