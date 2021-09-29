type clause = {
    loc : Locations.t;
    guard : IndexTerms.t;
    packing_ft : ArgumentTypes.packing_ft
  }

val pp_clause : clause -> Pp.document
val subst_clause : IndexTerms.t Subst.t -> clause -> clause


type predicate_definition = {
    loc : Locations.t;
    pointer: Sym.t;
    iargs : (Sym.t * LogicalSorts.t) list;
    oargs : (string * LogicalSorts.t) list;
    permission: Sym.t;
    clauses : clause list;
  }

val pp_predicate_definition : predicate_definition -> Pp.document


val predicate_list : Memory.struct_decls -> (string * predicate_definition) list
