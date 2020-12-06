module BT = BaseTypes
module LS = LogicalSorts
module RE = Resources
module LC = LogicalConstraints
module Loc = Locations


module VariableBinding : sig

  type t =
    | Computational of Sym.t * BT.t
    | Logical of LS.t
    | Resource of RE.t
    | UsedResource of RE.t * Loc.t list
    | Constraint of LC.t

end


type binding = Sym.t * VariableBinding.t

type t

val empty : t

val marked : t

val concat : t -> t -> t

val use_resource : Sym.t -> Loc.t list -> t -> t

val since : t -> binding list * t
val all : t -> binding list

val kind : Sym.t -> t -> Kind.t option
val bound : Sym.t -> t -> bool

val merge : t -> t -> t

val big_merge : t -> t list -> t


val pp : ?print_all_names:bool -> ?print_used:bool -> t -> Pp.document

val get_a : Sym.t -> t -> (BT.t * Sym.t)
val get_l : Sym.t -> t -> LS.t
val get_r : Sym.t -> t -> RE.t
val get_c : Sym.t -> t -> LC.t

val add_a : Sym.t -> (BT.t * Sym.t) -> t -> t
val add_l : Sym.t -> LS.t -> t -> t
val add_r : Sym.t -> RE.t -> t -> t
val add_c : Sym.t -> LC.t -> t -> t
val add_ur : RE.t -> t -> t
val add_uc : LC.t -> t -> t

val all_names : t -> Sym.t list

val all_computational : t -> (Sym.t * (Sym.t * BT.t)) list
val all_named_constraints : t -> (Sym.t * LC.t) list
val all_constraints : t -> LC.t list
val all_logical : t -> (Sym.t * LS.t) list
val all_resources : t -> RE.t list
val all_named_resources : t -> (Sym.t * RE.t) list
val all_used_resources : t -> (RE.t * Loc.t list) list
val all_named_used_resources : t -> (Sym.t * (RE.t * Loc.t list)) list


val (++) : t -> t -> t




val json :  t -> Yojson.Safe.t
