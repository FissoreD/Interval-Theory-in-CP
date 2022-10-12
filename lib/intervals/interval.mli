type t

val make_interval : float -> float -> t
(** Builds a valid interval taking two floats : the first bound is less or equal to the second *)

val empty : t
(** The empty interval  *)

val is_empty : t -> bool
(** Returns if an interval is empty *)

val size : t -> float
(** Returns the size of the interval *)

val ( ++ ) : t -> t -> t
(** The sum of two intervals *)

val ( -- ) : t -> t -> t
(** The difference of two intervals *)

val ( ** ) : t -> t -> t
(** The product of two intervals *)

val ( // ) : t -> t -> t
(** The division of two intervals *)

val ( && ) : t -> t -> t
(** The intersection of two intervals *)

val ( || ) : t -> t -> t
(** The union of two intervals *)

val ( >>= ) : t -> t -> t
(** The geq of an interval and a t intervals *)

val ( <<= ) : t -> t -> t
(** The leq of an interval and a t intervals *)

val ( == ) : t -> t -> t
(** The equal of two intervals *)

val print : ?dec:int -> t -> unit
