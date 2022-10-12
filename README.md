# Interval-Theory-in-CP

This project has been realized to provide an implementation in *Ocaml* of the *Interval Arithmetic* applied to the *Constraints Programming*.

More generally, given a set of variables each associated to a *continuous* interval *[a, b]*, and a list of constraints, we aim to filter the interval of each variable as much as possible to reduce the possibility to take affect a value to a variable which is not able to provide a solution to satisfy all constraints at the same time.

## Definitions

An interval is couple $[a, b]$ of *floats* such that $a \leq b$, otherwise the interval is invalid and therefore empty.

The allowed binary operations are:

- addition: $[a, b] + [c, d] = [a + c, b + d]$
- substraction: $[a, b] - [c, d] = [a - d, b - c]$
- multiplication: $[a, b] \times [c, d] = [\min(i \times j, \forall i, j \in \{a, b, c, d\}^2), \max(i \times j, \forall i, j \in \{a, b, c, d\}^2)]$
- division: $[a, b] \div [c, d] = [\min(i \div j, \forall i, j \in \{a, b, c, d\}^2), \max(i \div j, \forall i, j \in \{a, b, c, d\}^2)]$
- union: $[a, b] \cup [c, d] = [\min(a, c), \max(b,d)]$
- intersection: $[a, b] \cap [c, d] = [\max(a, c), \min(b,d)]$

The allowed unary operations are:
- unary subtraction: $-[a, b] = [-b, -a]$

The comparators on an interval are:

- less or equal: $[a, b] \leq n = [a, b] \cap [-\infty,  n]$
- great or equal: $[a, b] \geq n = [a, b] \cap [n, \infty]$
- equal: $[a, b] \leq n = [a, b] \cap [n,  n]$

The size of an interval $[a, b]$ is given by $b-a$.

> Note: the inverse operations between two interval are slightly different from the rules we are used to see in math since we want the original interval to be consistent. Therefore, if $i_1 - i_2 = r$ then $(r + i_2) \cap i_1$ returns the *new* value of $i_1$ and $(i_1 - r) \cap i_2$ returns the *new* value of $i_2$. A similar can be made for all the other binary operations.

## The HC4 algorithm

### One constraint analysis

From the rules defined before, we are able to analyse if a constraint has no solution. To do that we build an binary tree corresponding to the constraint we are given. 

From this tree, we make a bottom-top analyse sarting from leaves and attributing to each internal node the value corresponding to the operation provided by the current operation.

Once we arrive to the root of our tree, we make a top-bottom analyse, starting from the root and giving to each child the result of the inverse operation represented by the current node.

### Multiple constraint analysis

When we are giving multiple constraint to be analysed, we treat them one by one. If we treat the constraint $c_i$ and it does reduce the interval of at least one variable of a certain value, then the contraint is still considered valid and it is placed at the end of the constraint list in order to analyse the other constraints.

On the other hand, if $c_i$ doesn't improve enough the value of our interval, the we can ingore it and continue with the other constraint.

Once there are no more constraints to analyse, then the algorithm stops and returns the interval for each variable. 

## Project implementation

This project is based on a solver taking in input a problem defined as before following the following syntaxe:

```
f: interval_list; constr_list

constr_list: 
  | constr | constr constr_list

constr: 
  | expr >= FLOAT | expr <= FLOAT | expr = FLOAT

expr:
  | FLOAT  | VAR | FLOAT VAR  
  | expr * expr | expr / expr | expr + expr | expr - expr | ( expr )
  | - expr


interval_list:
  | VAR; FLOAT; FLOAT; interval_list 
  | SEP   
```

This grammar produces a **Mermory * Tree List** where 
- Memory is a dictionary associating to each variable its original domain 
- Tree List represents a list of constraints, where each tree is made of:
  - Leaves that are either a constant or the name of a variable
  - Nodes that are a records containing: the interval given by the application of the *HC4 algorithm*, the right and the left child, the operator

If the problem has no solution then the algorithm stop and returns Empty.


## Launch the main 

To launch to project you need the *Ocaml build system* [dune](https://github.com/ocaml/dune).

Throught *dune* you can launch:

- an executable which runs some unit tests. Command: `dune exec test`
- the main file, called `IntervalTheoryInCP`. Command: `dune exec -- IntervalTheoryInCP`.  
  It accepts some optional parameters:
  - **-p** Set the precision of the constraints.
  - **-v** Print each step of the algorithm execution in verbose mode.
  - **-t** Print the tree at each step in infix mode.
  - **-d** Set the decimal precision in print mode
  - **-f** Set the file path to read the input to parse.
  - **-help**  Display this list of options
  - **--help**  Display this list of options

By default the main parses the *input.txt* file in *./ressources*, the verbose mode is not enabled and the precision of the constraints is set to $0.1$.

### Execution example
Let *input.txt* contains:

```
  // Template
  x: [0, 8]
  y: [-1, 3]
  %%
  x + 4y = 8
  x + 2y = 6
```

then the output will be 

```
  Varialbes: 
  x[0.000, 8.000] y[-1.000, 3.000] 
  The constraints are: 
  ((x + (4.000 * y)) = 8.000)
  ((x + (2.000 * y)) = 6.000)
  ----------------------------------
  Program execution: 
  The final vairable intervals are: 
  x[3.938, 4.062] y[0.969, 1.031] 
```

___

Let *input.txt* contains:

```
  // Template
  x: [0, 8]
  y: [-1, 3]
  %%
  x + 4y = 8
  x + 2y = 6
```

then the output will be 

```
  Varialbes: 
  x[0.000, 8.000] y[-1.000, 3.000] 
  The constraints are: 
  ((x + (4.000 * y)) = 8.000)
  ((x + (2.000 * y)) = 6.000)
  ----------------------------------
  Program execution: 
  The final vairable intervals are: 
  x[3.938, 4.062] y[0.969, 1.031] 
```



## Supervisor

Mme [Marie Pelleau](https://www.i3s.unice.fr/~mpelleau/en/home/)