structure CopyConstPropFold = struct

(*
    (* An optimisation takes a program and returns a new program. *)
    val optimiseProgram : Fasto.KnownTypes.Prog -> Fasto.KnownTypes.Prog
*)

open Fasto
open Fasto.KnownTypes

exception Error of string * (int * int)

(* A propagatee is something that we can propagate - either a variable
   name or a constant value. *)
datatype Propagatee = ConstProp of Value
                    | VarProp of string

fun copyConstPropFoldExp vtable e =
    case e of
        Constant x => Constant x
      | StringLit x => StringLit x
      | ArrayLit (es, t, pos) =>
          (* es  is a Exp list, so we map *)
        ArrayLit (map (copyConstPropFoldExp vtable) es, t, pos)
      | Var (name, pos) =>

        (* TODO TASK 4: This case currently does nothing.

         You must perform a lookup in the symbol table and if you find
         a Propagatee, return either a new Var or Constant node. *)
         
         let in case SymTab.lookup name vtable of
              SOME (ConstProp x) => Constant(x, pos)
            | SOME (VarProp x) => Var(x, pos)
            | NONE => Var(name, pos)
         end

      | Plus (e1, e2, pos) =>
          (* e1 and e2 are both Exp, so we apply cCPFE to each *)
        let val e1' = copyConstPropFoldExp vtable e1
            val e2' = copyConstPropFoldExp vtable e2
        in case (e1', e2') of
               (* fixed order of pattern matching to reflect
               *  additive identity law *)
               (Constant (IntVal 0, _), _) =>
               e2'
             | (_, Constant (IntVal 0, _)) =>
               e1'
             | (Constant (IntVal x, _), Constant (IntVal y, _)) =>
               Constant (IntVal (x+y), pos)
             | _ =>
               Plus (e1', e2', pos)
        end
      | Minus (e1, e2, pos) =>
          (* same story as Plus *)
        let val e1' = copyConstPropFoldExp vtable e1
            val e2' = copyConstPropFoldExp vtable e2
        in case (e1', e2') of
               (* reduce 0 - n to -n, fixed order of patterns
               *  to reflect identities of subtraction *)
               (Constant (IntVal 0, _), _) =>
               Negate (e2', pos)
             | (_, Constant (IntVal 0, _)) =>
               e1'
             | (Constant (IntVal x, _), Constant (IntVal y, _)) =>
               Constant (IntVal (x - y), pos) (* fixed: was x + y *)
             | _ =>
               Minus (e1', e2', pos)
        end
      | Equal (e1, e2, pos) =>
        let val e1' = copyConstPropFoldExp vtable e1
            val e2' = copyConstPropFoldExp vtable e2
        in case (e1', e2') of
                (* Constants can be readily judged equal *)
               (Constant v1, Constant v2) =>
               Constant (BoolVal (v1 = v2), pos)

               (* identical expressions are neccesarily equal *)
             | _ => if e1' = e2'
                    then Constant (BoolVal true, pos)
                    else Equal (e1', e2', pos)
        end

      | Less (e1, e2, pos) =>
        let val e1' = copyConstPropFoldExp vtable e1
            val e2' = copyConstPropFoldExp vtable e2
        in case (e1', e2') of
               (Constant (IntVal v1, _), Constant (IntVal v2, _)) =>
               Constant (BoolVal (v1 < v2), pos)

               (* identical expressions are equal, therefore one is not strictly
               *  less than the other *)
             | _ => if e1' = e2'
                    then Constant (BoolVal false, pos)
                    else Less (e1', e2', pos)
        end

      | If (e1, e2, e3, pos) =>
        let val e1' = copyConstPropFoldExp vtable e1
        in case e1' of
               (* resolve constant if statements *) 
               Constant (BoolVal b, _) => if b
                                          then copyConstPropFoldExp vtable e2
                                          else copyConstPropFoldExp vtable e2
             | _ => If (e1',
                        copyConstPropFoldExp vtable e2,
                        copyConstPropFoldExp vtable e3,
                        pos)
        end

      | Append (e1, e2, pos) => 
        Append (copyConstPropFoldExp vtable e1,
                copyConstPropFoldExp vtable e2,pos) 

      | Apply (fname, es, pos) =>
          (* es -- the argument list, is a Exp list, so we fold *)
        Apply (fname, map (copyConstPropFoldExp vtable) es, pos)

      | Let (Dec (name, e, decpos), body, pos) =>

        (* TODO TASK 4: This case currently does nothing.

         You must extend this case to expand the vtable' with whatever
         Propagatee that you can get out of e'.  That is, inspect e'
         to see whether it is a constant or variable, and if so,
         insert the appropriate Propagatee value in vtable. *)

        let val e' = copyConstPropFoldExp vtable e
            val (vtable', prop) =
                  (* a problem seemingly arises here, consider the
                  * contrived situation:
                  *
                  *  let a = <thing> in
                  *  let b = a in
                  *  let a = 1 in
                  *    <body>
                  *
                  * the first `a` would be captured by the `b` an
                  * then erroneously be replaced by `a` in <body>, which
                  * would then be replaced by 1 when processing the second
                  * binding of `a`.
                  *
                  * To effect this, I added a new method on SymTab:
                  * `filter`
                  *
                  * In effect, when a constant binding is encountered,
                  * all previous variable propagations of that variable
                  * are deleted.
                  *)
                case e' of 
                     Constant(v, _) =>
                       let fun isntName (VarProp n) = name <> n
                             | isntName _ = true
                           val vtable' = SymTab.filter isntName vtable
                        in (SymTab.bind name (ConstProp v) vtable', true) end
                   | Var(n, _) => (* Var n will never be in the vtable,
                                  *  otherwise it would have been propagated *)
                       (SymTab.bind name (VarProp n) vtable, true)
                   | _ => (vtable, false)
        in if prop then
                (* bonus, if we can propagate it, the Let is extraneous *)
                copyConstPropFoldExp vtable' body
           else Let (Dec (name, e', decpos),
                copyConstPropFoldExp vtable' body,
                pos)
        end
      | Index (name, e, t, pos) =>
        let val e' = copyConstPropFoldExp vtable e
        in (* We can only copy-propagate variables for indexing. *)
            case SymTab.lookup name vtable of
                SOME (VarProp newname) => Index (newname, e', t, pos)
              | _ => Index (name, e, t, pos)
        end
      | Iota (e, pos) =>
        Iota (copyConstPropFoldExp vtable e, pos)
      | Map (farg, e, t1, t2, pos) =>
        Map (copyConstPropFoldFunArg vtable farg,
             copyConstPropFoldExp vtable e,
             t1, t2, pos)
      | Reduce (farg, e1, e2, t, pos) =>
        Reduce (copyConstPropFoldFunArg vtable farg,
                copyConstPropFoldExp vtable e1,
                copyConstPropFoldExp vtable e2,
                t, pos)
      | Replicate (e1, e2, t, pos) =>
        Replicate (copyConstPropFoldExp vtable e1,
                   copyConstPropFoldExp vtable e2,
                   t, pos)
      | Filter (farg, e, t, pos) =>
        Filter (copyConstPropFoldFunArg vtable farg,
                copyConstPropFoldExp vtable e,
                t, pos)
      | Scan (farg, e1, e2, t, pos) =>
        Scan (copyConstPropFoldFunArg vtable farg,
              copyConstPropFoldExp vtable e1,
              copyConstPropFoldExp vtable e2,
              t, pos)
      | ArrCompr (e, bs, cs, e_tp, arr_tps, pos) =>
        ArrCompr (copyConstPropFoldExp vtable e,
                  map (fn (n, x) => (n, copyConstPropFoldExp vtable x)) bs,
                  map (copyConstPropFoldExp vtable) cs,
                  e_tp, arr_tps, pos)
      | Read (t, pos) =>
        Read (t, pos)
      | Write (e, t, pos) =>
        Write (copyConstPropFoldExp vtable e, t, pos)


  (* TODO TASKS 1/4: add cases for Times, Divide, Negate, Not, And, Or.  Look at
  how Plus and Minus are implemented for inspiration.
   *)
      | Times (e1, e2, pos) =>
        let val e1' = copyConstPropFoldExp vtable e1
            val e2' = copyConstPropFoldExp vtable e2
        in case (e1', e2') of
              (* all multiplicative identities implemented here:
              * 1 * x = x = x * 1
              * 0 * x = 0 = x * 0
              * *)
               (Constant (IntVal 0, _), _) =>
               Constant (IntVal 0, pos)
             | (_, Constant (IntVal 0, _)) =>
               Constant (IntVal 0, pos)
             | (Constant (IntVal 1, _), _) =>
               e2'
             | (_, Constant (IntVal 1, _)) =>
               e1'
             | (Constant (IntVal x, _), Constant (IntVal y, _)) =>
               Constant (IntVal (x*y), pos)
             | _ =>
               Times (e1', e2', pos)
        end

      | Divide (e1, e2, pos) =>
        let val e1' = copyConstPropFoldExp vtable e1
            val e2' = copyConstPropFoldExp vtable e2
        in case (e1', e2') of
              (* all division identities implemented here
              * catches divsion by zero early
              * 
              * x/1 = x
              * 0/x = 0
              * *)
               (_, Constant (IntVal 0, _)) =>
               raise Error ("Division by zero detected", pos)
             | (Constant (IntVal 0, _), _) =>
               Constant (IntVal 0, pos)
             | (_, Constant (IntVal 1, _)) =>
               e1'
             | (Constant (IntVal x, _), Constant (IntVal y, _)) =>
               Constant (IntVal (Int.quot(x,y)), pos)
             | _ =>
               Divide (e1', e2', pos)
        end

      | And (e1, e2, pos) =>
        let val e1' = copyConstPropFoldExp vtable e1
            val e2' = copyConstPropFoldExp vtable e2
        in case (e1', e2') of
                (* conjunctive identities:
                *
                * T & x = x = x & T
                * F & x = F = x & F
                * *)
               (Constant (BoolVal true, _), _) => e2'
             | (Constant (BoolVal false, _), _) => Constant (BoolVal false, pos)
             | (_, Constant (BoolVal true, _)) => e1'
             | (_, Constant (BoolVal false, _)) => Constant (BoolVal false, pos)
             | _ => And (e1', e2', pos)
        end

      | Or (e1, e2, pos) =>
        let val e1' = copyConstPropFoldExp vtable e1
            val e2' = copyConstPropFoldExp vtable e2
        in case (e1', e2') of
                (* disjunctive identities:
                *
                * F & x = x = x & F
                * T & x = T = x & T
                * *)
               (Constant (BoolVal true, _), _) => Constant (BoolVal true, pos)
             | (Constant (BoolVal false, _), _) => e2'
             | (_, Constant (BoolVal true, _)) =>  Constant (BoolVal true, pos)
             | (_, Constant (BoolVal false, _)) => e1'
             | _ => Or (e1', e2', pos)
        end

      | Negate (e, pos) =>
        let val e' = copyConstPropFoldExp vtable e
        in case e' of
               Constant (IntVal x, _) => Constant (IntVal (~x), pos)
             | _ => Negate (e', pos)
        end

      | Not (e, pos) =>
        let val e' = copyConstPropFoldExp vtable e
        in case e' of
               Constant (BoolVal x, _) => Constant (BoolVal (not x), pos)
             | _ => Not (e', pos)
        end

and copyConstPropFoldFunArg vtable (FunName fname) =
    FunName fname
  | copyConstPropFoldFunArg vtable (Lambda (rettype, params, body, pos)) =
    (* Remove any bindings with the same names as the parameters. *)
    let val paramNames = (map (fn (Param (name, _)) => name) params)
        val vtable' = SymTab.removeMany paramNames vtable
    in Lambda (rettype, params, copyConstPropFoldExp vtable' body, pos)
    end

fun copyConstPropFoldFunDec (FunDec (fname, rettype, params, body, loc)) =
    let val body' = copyConstPropFoldExp (SymTab.empty ()) body
    in FunDec (fname, rettype, params, body', loc)
    end

fun optimiseProgram prog =
    map copyConstPropFoldFunDec prog
end
