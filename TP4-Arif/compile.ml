open Ast
open Mips
open Format



(* Constantes pour la représentation des données. *)
let word_size   = 4
let data_size   = word_size

let not_implemented() = failwith "Not implemented"


(* Création d'une nouvelle étiquette pour les branchements. *)
let new_label =
  let c = ref 0 in
  fun () -> incr c; sprintf "__label__%05i" !c

module Env = Map.Make(String)

type var_loc =
| Global_var of int
| Local_var  of int

type venv = var_loc Env.t


    
(* Les fonctions [push], [peek] et [pop] sont là pour vous aider à manipuler
   la pile. *)
  
(* val push : register -> text 
  [push reg] place le contenu de [reg] au sommet de la pile.
  $sp pointe sur l'adresse de la dernière case occupée. *)
let push reg =
  sub sp sp oi word_size
  @@ sw reg areg (0, sp)

(* val peek : register -> text
  [peek reg] place la valeur en sommet de pile dans [reg] sans dépiler. *)
let peek reg =
  lw reg areg (data_size - 4, sp)

(* val pop : register -> text
  [pop reg] place la valeur en sommet de pile dans [reg] et dépile. *)
let pop reg =
  peek reg
  @@ add sp sp oi data_size



    
(* La fonction de compilation des expressions prend en argument :
   l'expression à compiler. *)
let rec compile_expr env e =
  match e.expr with

    | Econst c -> begin
      match c with
	| Cunit       -> push zero
	  
	(* À compléter avec les autres formes de constantes. *)
	| Cint i      -> li a0 i @@ push a0
	  
	| Cbool b     -> begin
	  match b with
	  | true  -> li a0 1 @@ push a0
	  | false -> li a0 0 @@ push a0
	end
	| _           -> not_implemented() 
    end

    | Eunop (op, e) -> begin
      match op with
      | Uminus ->
	let exp = compile_expr env e in
	exp
	@@ pop a0
	@@ sub a0 zero oreg a0
	@@ push a0

      | Unot ->
	let exp = compile_expr env e in
	let labelNot = new_label() in
	let labelFin = new_label() in
	exp
	@@ pop a0
	@@ beqz a0 labelNot
	@@ li a0 0
	@@ b labelFin

	@@ label labelNot
	@@ li a0 1

	@@ label labelFin
	@@ push a0
	  
      | _ -> not_implemented()
	  
    end
	
    | Ebinop (op, e1, e2) -> begin
      match op with
      | Badd ->
	let exp1 = compile_expr env e1 in
	let exp2 = compile_expr env e2 in
        exp1
	@@ exp2
	@@ pop a1
	@@ pop a0
	@@ add a0 a0 oreg a1
	@@ push a0
      | Bsub ->
	let exp1 = compile_expr env e1 in
	let exp2 = compile_expr env e2 in
	exp1
	@@ exp2
	@@ pop a1
	@@ pop a0
	@@ sub a0 a0 oreg a1
	@@ push a0
      | Bmul ->
	let exp1 = compile_expr env e1 in
	let exp2 = compile_expr env e2 in
	exp1
	@@ exp2
	@@ pop a1
	@@ pop a0
	@@ mul a0 a0 oreg a1
	@@ push a0
      | Bdiv ->
	let exp1 = compile_expr env e1 in
	let exp2 = compile_expr env e2 in
	exp1
	@@ exp2
	@@ pop a1
	@@ pop a0
	@@ div a0 a0 oreg a1
	@@ push a0

      | Beq ->
	let exp1 = compile_expr env e1 in
	let exp2 = compile_expr env e2 in
	exp1
	@@ exp2
	@@ pop a1
	@@ pop a0
	@@ seq a0 a0 a1
	@@ push a0
      | Bneq ->
	let exp1 = compile_expr env e1 in
	let exp2 = compile_expr env e2 in
	exp1
	@@ exp2
	@@ pop a1
	@@ pop a0
	@@ sne a0 a0 a1
	@@ push a0
      | Blt ->
	let exp1 = compile_expr env e1 in
	let exp2 = compile_expr env e2 in
	exp1
	@@ exp2
	@@ pop a1
	@@ pop a0
	@@ slt a0 a0 a1
	@@ push a0
      | Ble ->
	let exp1 = compile_expr env e1 in
	let exp2 = compile_expr env e2 in
	exp1
	@@ exp2
	@@ pop a1
	@@ pop a0
	@@ sle a0 a0 a1
	@@ push a0
      | Bgt ->
	let exp1 = compile_expr env e1 in
	let exp2 = compile_expr env e2 in
	exp1
	@@ exp2
	@@ pop a1
	@@ pop a0
	@@ sgt a0 a0 a1
	@@ push a0
      | Bge ->
	let exp1 = compile_expr env e1 in
	let exp2 = compile_expr env e2 in
	exp1
	@@ exp2
	@@ pop a1
	@@ pop a0
	@@ sge a0 a0 a1
	@@ push a0
      | Band ->
	let exp1 = compile_expr env e1 in
	let exp2 = compile_expr env e2 in
	exp1
	@@ exp2
	@@ pop a1
	@@ pop a0
	@@ and_ a0 a0 a1
	@@ push a0
      | Bor ->
	let exp1 = compile_expr env e1 in
	let exp2 = compile_expr env e2 in
	exp1
	@@ exp2
	@@ pop a1
	@@ pop a0
	@@ or_ a0 a0 a1
	@@ push a0
	  
      | _ -> not_implemented()
    end

    | Eif (eIf, eThen, eElse) -> begin
      let exp1 = compile_expr env eIf in
      let exp2 = compile_expr env eThen in
      let exp3 = compile_expr env eElse in
      let labelTrue = new_label() in
      let labelFin = new_label() in
      exp1
      @@ pop a0
      @@ bnez a0 labelTrue
      @@ exp3
      @@ b labelFin

      @@ label labelTrue
      @@ exp2

      @@ label labelFin
      @@ push a0
	
    end
      
    | Eident i -> begin
      let pos =
	try 
	  Env.find i env
	with
	| Not_found -> failwith "Ident not found"
      in
      match pos with
      | Global_var g -> lw a0 areg (g, gp) @@ push a0
      | Local_var  l -> not_implemented()
    end
      
  
      
      
      
    (* Pour l'affichage, on calcul la valeur de l'argument, puis on saute au
       fragment de code gérant l'affichage proprement dit. *)
    | Eprint_newline e ->
      let e_code = compile_expr env e in
      e_code
      @@ jal "print_newline"
	
    (* À compléter avec les autres formes d'expressions. *)
    | Eprint_int e ->
      let e_code = compile_expr env e in
      e_code
      @@ jal "print_int"

    | _ -> not_implemented()
	


      
(* Les instructions sont calculées l'une après l'autre. *)
let rec compile_instr_list env il nxt_global =
  match il with
    | []       -> nop

    (* À compléter pour le cas [Icompute] et l'itération. *)
    |  i::r -> match i with
      | Icompute e     -> (compile_expr env e) @@ (compile_instr_list env r nxt_global)
      | Ilet (id, exp) ->
	let exprExp = compile_expr env exp in
	let newEnv = Env.add id (Global_var(nxt_global)) env in
	let suite = compile_instr_list newEnv r (nxt_global + 1) in
	exprExp
	@@ pop t0
	@@ sw t0 areg (4 * nxt_global, gp)
	@@ suite
       
	
    | _ -> not_implemented()



      
(* Fragments de code pour [print_int] et [print_newline]. *)
let built_ins () =
  label "print_newline"
  @@ pop zero
  @@ li v0 11
  @@ li a0 10
  @@ syscall
  @@ push zero
  @@ jr ra
    
  (* À compléter avec le code de [print_int]. *)
  @@ label "print_int"
  @@ pop a0
  @@ li v0 1
  @@ syscall
  @@ push a0
  @@ jr ra

    
    
    
    
(* La compilation du programme produit un code en trois parties :
   1/ Le code principal (label "main")
   2/ Une instruction de fin (label "end_exec")
   3/ Le code des fonctions d'affichage (built_ins_code)
*)
let compile_prog p =
  let main_code = compile_instr_list Env.empty p 0 in
  let built_ins_code = built_ins () in
  
  { text =
     comment "Code principal"
  @@ label "main"
  @@ main_code
       
  @@ comment "Fin"
  @@ label "end_exec"
  @@ li v0 10
  @@ syscall
       
  @@ comment "Primitives"
  @@ built_ins_code
  ;
    
    data = nop
  }
