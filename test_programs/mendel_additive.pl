/*
MR Logic
This program is a rewrite of http://cplint.eu/e/mendel.pl using clearer predicate names and additive rather than dom/rec
The program can be run in cplint online or local. http://cplint.eu
*/
:- use_module(library(pita)).

:- if(current_predicate(use_rendering/1)).
:- use_rendering(c3).
:- endif.

:- pita.

:- begin_lpad.

%c is the child of mother m and father f.
mother_child(m,c).
father_child(f,c).

%It is known that the mother has genotype aA and Father has genotype Aa.
person_chromosome_genotype(m,1,1).
person_chromosome_genotype(m,2,2).
person_chromosome_genotype(f,1,1).
person_chromosome_genotype(f,2,2).

% The allele of a child on chr1 is inherited from its mother, the two alleles of the mother have equal probability of being transmitted.
person_chromosome_genotype(Child,1,Allele1):0.5 ; person_chromosome_genotype(Child,1,Allele2):0.5 :- 
    mother_child(Mother,Child),
    person_chromosome_genotype(Mother,1,Allele1),
    person_chromosome_genotype(Mother,2,Allele2).
% The same for father on chr2
person_chromosome_genotype(Child,2,Allele1):0.5 ; person_chromosome_genotype(Child,2,Allele2):0.5 :- 
    father_child(Father,Child),
    person_chromosome_genotype(Father,1,Allele1),
    person_chromosome_genotype(Father,2,Allele2).


person_phenotype(X,V3):- person_chromosome_genotype(X,1,V1),person_chromosome_genotype(X,2,V2),V3 is V1+V2.


:- end_lpad.

/** <examples>

?-prob(person_phenotype(c,2),Prob).
?-prob(person_phenotype(c,3),Prob).
?-prob(person_phenotype(c,4),Prob).
*/

