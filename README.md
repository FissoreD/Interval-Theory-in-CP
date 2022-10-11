# Interval-Theory-in-CP

This project has been realized to provide an implementation in *Ocaml* of the *Interval Arithmetic* applied to the *Constraints Programming*.

More generally, given a set of variables each associated to a *continuous* interval *[a, b]*, and a list of constraints, we aim to filter the interval of each variable as much as possible to reduce the possibility to take affect a value to a variable which is not able to provide a solution to satisfy all constraints at the same time.

## Definitions

An interval is couple $[a, b]$ of *floats* such that $a \leq b$, otherwise the interval is invalid and therefore empty.

The allowed operations over two intervals are :

- addition : $[a, b] + [c, d] = [a + c, b + d]$
- substraction : $[a, b] - [c, d] = [a - d, b - c]$
- multiplication : $[a, b] \times [c, d] = [\min(i \times j, \forall i, j \in \{a, b, c, d\}^2), \max(i \times j, \forall i, j \in \{a, b, c, d\}^2]$
- division : $[a, b] \div [c, d] = [\min(i \div j, \forall i, j \in \{a, b, c, d\}^2), \max(i \div j, \forall i, j \in \{a, b, c, d\}^2]$
- union : $[a, b] \cup [c, d] = [\min(a, c), \max(b,d)]$
- intersection : $[a, b] \cap [c, d] = [\max(a, c), \min(b,d)]$

The comparators on an interval are :

- less or equal : $[a, b] \leq n = [a, b] \cap [-\infty,  n]$
- great or equal : $[a, b] \geq n = [a, b] \cap [n, \infty]$
- equal : $[a, b] \leq n = [a, b] \cap [n,  n]$

The size of an interval $[a, b]$ is given by $b-a$.

> Note: the inverse operations between two interval are slightly different from the rules we are used to see in math since we want to keep the consistence of the original intervals. Therefore, if $i_1 - i_2 = r$ then $(r + i_2) \cap i_1$ returns the *new* value of $i_1$ and $(i_1 - r) \cap i_2$ returns the *new* value of $i_2$. A similar can be made for all the other binary operations.

## The HC4 algorithm

From the rules defined before, we are able to analyse if a constraint has no solution, but we need to reduce ...

## Project implementation

This project is based on a solver that takes in input a constraint problem defined as before. The sintaxe of the file is parsed by *Ocamellex* and *Menhir* and the grammar is :

```
f: interval_list; constr_list

constr_list: 
  | constr | constr constr_list

constr: 
  | expr >= FLOAT | expr <= FLOAT | expr = FLOAT

expr:
  | FLOAT  | VAR | FLOAT VAR  
  | expr * expr | expr / expr | expr + expr | expr - expr


interval_list:
  | VAR; FLOAT; FLOAT; interval_list 
  | SEP   
```

This grammar produces a **Mermory * Tree List** where 
- Memory is a dictionary associating to each variable its original domain 
- Tree List represents a list of constraint, where each tree is made of :
  - Leaves that are either a constant or the name of a variable
  - Nodes that are a records containing: the interval given by the application of the *HC4 algorithm*, the right and the left child, the operator


## Launch the main 

To launch to project you need the *Ocaml build system* [dune](https://github.com/ocaml/dune).

The executable of this project are :

- an executable which runs some unit tests callable with `dune exec test`
- the main executable, called `IntervalTheoryInCP`. It can be launched throught the command `dune exec -- IntervalTheoryInCP` and it accepts some optional parameter:
  - **-p** Set the precision of the constraints.
  - **-v** Print each step of the algorithm execution in verbose mode.
  - **-t** Print the tree at each step in infix mode.
  - **-d** Set the decimal precision in print mode
  - **-f** Set the file path to read the input to parse.
  - **-help**  Display this list of options
  - **--help**  Display this list of options

## Supervisor

Mme [Marie Pelleau](https://www.i3s.unice.fr/~mpelleau/en/home/)