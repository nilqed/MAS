# MAS
MAS: Modula-2 Algebra System

This project is an attempt to revive/compile MAS with the GNU Modula-2 Compiler  --  🚧 ⚠️

https://gcc.gnu.org/onlinedocs/gm2/

https://www.gnu.org/savannah-checkouts/non-gnu/gm2/10/about.html

The source files were renamed to `def` and `mod` respectively. 
Some issues (casting) have been resolved by using `VAL` to convert between `ÌNTEGER` and `LIST` type. 

see: https://lists.gnu.org/archive/html/gm2/2024-03/msg00129.html

   Use VAL(INTEGER, list) , VAL(LIST, int) ....

TODO: FOREIGN MODULES, not-implemented messages in `gm2` ... any help welcome 💚


## Abstract
MAS (Modula-2 Algebra System) is an experimental computer algebra system, developed at the University of Passau. MAS combines imperative programming facilities with algebraic specification capabilities for design and study of algebraic algorithms. It contains a large library of implemented Groebner basis algorithms for nearly all algebraic structures where such methods exist. MAS further includes algorithms for real quantifier elimination, parametric real root counting, and for computing in (noncommutative) polynomial rings. 

## Introduction to MAS
Starting point for the development of MAS was the requirement for a computer algebra system with an up to date language and design which makes the existing ALDES / SAC-2 algorithm libraries available. At this time there have been about 650 algorithms in ALDES / SAC-2 and in addition I had 450 algorithms developed on top of ALDES / SAC-2. The tension of reusing existing software in an interactive environment with specification capabilities contributes most to the evolution of MAS.

The resulting view of the software has many similarities with the model theoretic view of algebra. The abstract specification capabilities are realized in a way that an interpretation in an example structure (a model) can be denoted. This means that is is not only possible to compute in term models modulo some congruence relation, but it is moreover possible to exploit an fast interpretation in some optimized (or just existing) piece of software.
Overview
MAS is an experimental computer algebra system combining imperative programming facilities with algebraic specification capabilities for design and study of algebraic algorithms. The goal of the MAS system is to provide:

    an interactive computer algebra system
    comprehensive algorithm libraries, including the ALDES/SAC-2 system [Collins 82],
    a familiar program development system with an efficient compiler,
    an algebraic specification component for data structure and algorithm design
    algorithm documentation open to the users. 

Key attributes of the MAS system are:

    portability (it is portable to a computer during a student exercise `Praktikum'), machine dependencies isolated in a small kernel,
    extendability (it is possible to add and interface to external algorithm libraries), open system architecture, transparent low level facilities:
    storage management (garbage collection is provided without user cooperation), stable error handling (no system break down on misspelled expressions and runtime exceptions), input /  output with streams (no changes are required to existing libraries to redirect I/O).
    effectivity (critical parts can be compiled and still be accessed interactively)
    expressiveness (possiblitity to specify abstract algebraic concepts like rings or fields) 

The goals and attributes have been achieved by the following main design concepts:

MAS replaces the ALDES language [Loos 76] and the FORTRAN implementation system of SAC-2 by the Modula-2 language [Wirth 85]. Modula-2 is well suited for the development of large program libraries; the language is powerful enough to implement all parts of a computer algebra system and the Modula-2 compilers have easy to use program development environments.

To provide an interactive calculation system a LISP interpreter is implemented in Modula-2 with full access to the library modules. For better usability a Modula-2 like imperative (interaction) language was defined, including a type system and function overloading capabilities. To increase expressiveness high-level specification language constructs have been included together with conditional term rewriting capabilities. They resemble facitilies known from algebraic specification languages like ASL [Wirsing 86].

Further design issues are:

MAS views mathematics in the sense of universal algebra and model theory and is in some parts influenced by category theory. In contrast to other computer algebra systems (like Scratchpad II [Jenks 85]), the MAS concept provides a clean seperation of computer science and mathematical concepts. The MAS language and its interpreter has no knowledge of mathematics and mathematical objects; however it is capable to describe (specify) and implement mathematical objects and to use libraries of implemented mathematical methods. Further the imperative programming, the conditional rewriting and function overloading concepts are seperated in a clean way.

MAS includes the capability to join specifications and to rename sorts and operations during import of specifications. This allows both the specification of abstract objects (rings, fields), concrete objects (integers, rational numbers) and concrete objects in terms of abstract objects (integers as a model of rings). Specifications can be parameterized in the sense of lambda-abstraction.

The semantics of a specification can be described either by implementations, axioms or models. The implementation part describes (imperative) procedures and data representations.

The axioms part describes conditional rewrite rules which define a reduction relation on the term algebra generated by the sorts and operations of the specification. The semantics is therefor the class of models of the term algebra modulo the (congruence) relation. Currently there are no facilities to solve conditional equations.

The model part describes the association between abstract specifications (like rings) and concrete specifications (like integers). The semantics is the interpretation of the (abstract) function in the model. Operations in models can be compiled functions, user defined imperative functions or term rewrite rules. The function overloading capabilities are realized by this concept. Dynamic abstract objects like finite fields can be handled by a descriptor concept.

Evaluation of functional terms is as follows: If there is a model in which the function has an interpretation and a condition on the parameters is fulfilled, then the interpretation of the function in this model is applied to the interpretation (values) of the arguments. If there is an imperative procedure, then the procedure body is evaluated in the procedure context. If the unification with the left hand side of a rewrite rule is possible and the associated condition evaluates to true, then the right hand side of the rewrite rule is evaluated. Otherwise the functional term is left unchanged.

In contrast to functional programming languages (like SML [Appel 88]) which implement typed lambda calculus the types of operations are not deduced from the program text but must be explicitly defined in the specification of an operation, in a variable declaration or in a typed string expression.

A weak point in the current MAS design is that the language is only interpreted. This is actualy not a handicap in execution speed since compiled libraries can be used, but in a too weak semantic analysis of the specifications. This means that certain errors in the specifications are only detected during actual evaluation of an expression.
Achievements and Current State
The steps towards the MAS system have been:

    definition of a syntax transformation scheme between ALDES and Modula-2; development of a translator and translation of most of the ALDES / SAC-2 libraries to Modula-2;
    development of a storage management system in Modula-2 with automatic garbage collection in an uncooperative environment; implementation of a input / output system in Modula-2 with streams;
    implementation of a LISP interpreter in Modula-2 with access to the compiled procedures (using Modula-2 procedure types and variables);
    definition of an imperative Modula-2 like interaction language;
    implementation of a parser for the interaction language and corresponding modifications to the LISP interpreter;
    design of high-level language constructs for algebraic specification and a type system with function overloading capabilities; modification of the language parser and the interpreter;
    design of specifications for relevant algebraic structures. 

Steps 1 and 2 were subject to the restriction that the interface had to be compatible with the existing ALDES / SAC-2 libraries. Steps 1 and 2 have been reported in [Kredel 88]. Reports on steps 3, 4, 5 and progress reports on step 6 have been given in [Kredel 90]. The state of step 6 has been reported in [Kredel 91].

Versions of the MAS system are running on Atari ST (TDI and SPC Modula-2 compilers), IBM PC/AT (M2SDS and Topspeed Modula-2 compilers) and Commodore Amiga (M2AMIGA compiler). The actual implementations run on UN*X workstations (e.g. IBM RS6000/AIX, HP 9000/HP-UX, NextStep, Sun Sparc with a Modula-2 to C translator) and PCs 386, 486, 586 (DOS, OS2 and Linux).

The ALDES/SAC-2 libraries have been implemented including the Polynomial Factorization System and the Real Root Isolation System. From the DIP system the Buchberger Algorithm System and the Ideal Decomposition and Ideal Real Root System have been implemented. Groebner Bases are also available for non-commutative polynomial rings of solvable type. The combination of the MAS programs with numerical Modula-2 libraries has been tested. The mathematical libraries have been enlarged by a package for linear algebra. Further new developments are syzygies, module Groebner bases, comprehensive Groebner bases, (parametric) real root counting, real quantifier elimination, involutive bases and invariant polynomials.

Some logic programming facilities have been incorporated by means of the conditional rewriting capabilities of the algebraic specification component. Further there is a parser for the ALDES language and the MAS interpreter is now able to evaluate ALDES statements (although with low performance). In the symbol table system the unbalanced symbol tree has been repaced by a hash table with balanced symbol tree entries.

The current development concentrates on filling some gaps in the ALDES / SAC-2 and DIP libraries, the design of suitable specifications for relevant algebraic structures and completing the system documentation.
Bibliography

[Appel 88]
    A. W. Appel, R. Milner, R. W. Harper, D. B. MacQueen, "Standard ML Reference Manual (preliminary draft)", University of Edinburgh, LFCS Report, 1988. 
    
[Collins 82]
    G.E. Collins, R. Loos, "ALDES/SAC-2 now available", SIGSAM Bulletin 1982, and several reports distributed with the ALDES/SAC-2 system. 
    
[Jenks 85]
    R. D. Jenks et al., "Scratchpad II Programming Language Manual", Computer Algebra Group, IBM, Yorktown Heights, NY, 1985. 
    
[Kredel 88]
    H. Kredel, "From SAC-2 to Modula-2", Proc. ISSAC'88 Rome, LNCS 358, pp 447-455, Springer, 1989. 
    
[Kredel 90]
    H. Kredel, "MAS Modula-2 Algebra System", Proc. DISCO 90 Capri, LNCS 429, pp 270-271, Springer, 1990. 
    
[Kredel 91]
    H. Kredel, "The MAS Specification Component", Proc. PLILP 91 Passau, LNCS 528, pp 39-50, Springer, 1991. 
    
[Loos 76]
    R. G. K. Loos. "The Algorithm Description Language ALDES (Report)", SIGSAM Bulletin 14/1, pp 15-39, 1976. 
    
[Wirsing 86]
    M. Wirsing, "Structured Algebraic Specifications: A Kernel Language", Theoretical Computer Science 42, pp 123-249, Elsevier Science Publishers B.V. (North-Holland) (1986). 
    
[Wirth 85]
    N. Wirth, "Programming in Modula-2", Springer, Berlin, Heidelberg, New York, 1985. 

Availability
MAS (0.3x, 0.6x, 0.7x and 1.0x) is available from: ftp://alice.fmi.uni-passau.de/pub/ComputerAlgebraSystems/mas (went offline in 2009) or from Mannheim mirror


Acknowledgements
Due to limited space we apologize for only global thanks to all who made contributions and influenced the project. Copyrights:

 MAS:         (c) 1989-1998, by H. Kredel, University Mannheim, 
                             M. Pesch, University Passau.
 ALDES/SAC-2: (c) 1982, by G.E.Collins, R.Loos.  

All Rights Reserved. Permission is granted for unrestricted noncommercial use and noncommercial redistribution if the copyright notice is retained when a copy is made. There are no known bugs, however we disclaim any usefulness and make no warranty on the correctness of the Modula-2 Algebra System. For certain machines and/or operating systems further copying restrictions apply, e.g. see the files

    copying.mas, copying.reuse, copying.mtc, 
    copying.emx, copying, copying.lib and copying.bsd

in the exam directory. The C code has been generated from the Modula-2 sources of MAS with the 'mtc' 'Modula-2 to C' translator by GMD Karlsruhe. Although it is not required, you should get a copy of it from some ftp site to have the sources of the used libraries. The executables for PC have been compiled using the GNU gcc compiler with the emx runtime system by Ernst Mattes. The latest versions and documentation of emx can also be found on ftp servers.



Heinz Kredel, University of Mannheim, L 15, 16, D-68131 Mannheim, Germany.

---
See also: https://github.com/GunterMueller/MAS_Modula-2_Algebra_System
