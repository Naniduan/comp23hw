(** Copyright 2023-2024, Grigory Aseev and Matvey Kalashnikov *)

(** SPDX-License-Identifier: LGPL-2.1-or-later *)

open Ast

(** Ast without anonymous functions, arguments are listed *)

type llexpr =
  | LLConst of const (** constants such as integers, boolean, unit*)
  | LLBinOp of bin_op * llexpr * llexpr
  (** binary operations such as add, multiply, equality checking etc. *)
  | LLVar of id (** identifier for variables *)
  | LLIf of llexpr * llexpr * llexpr (** conditionals *)
  | LLApp of llexpr * llexpr (** applying a function to an argument *)
  | LLLetIn of bool * id * llexpr * llexpr (** binding to a variable *)

type llbinding =
  | LLLet of bool * id * pattern list * llexpr (** binding to a function with arguments *)

(** type containing functions at the top level *)
type llprogram = llbinding list
