/*
MR Logic
This program is a rewrite of http://cplint.eu/e/mendel.pl using clearer predicate names.
It models the probabilities of traits under a dominant and recessive situation.
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
person_chromosome_genotype(m,1,a).
person_chromosome_genotype(m,2,b).
person_chromosome_genotype(f,1,a).
person_chromosome_genotype(f,2,b).

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

% if an individual has a b allele its phenotype is purple, i.e., purple is
% dominant
person_phenotype(X,purple):- person_chromosome_genotype(X,_,b).

person_phenotype(X,white):- person_chromosome_genotype(X,1,a),person_chromosome_genotype(X,2,a).
% if an individual has two 'a' alleles its phenotype is white, i.e., white is
% recessive

:- end_lpad.

/** <examples>
%1.
?- prob(person_phenotype(c,purple),Prob). % what is the probability that the phenotype of c is purple?
% expected result 0.75

%2.
?- prob(person_phenotype(c,white),Prob). % what is the probability that the phenotype of c is white?
%  expected result 0.25

%3.
?-prob(person_chromosome_genotype(c,1,a),Prob). %What is the prob that the allele on chr1 of c is a?
% expected result 0.5

%4.
?-prob(person_chromosome_genotype(c,1,b),Prob). %What is the prob that the allele on chr1 of c is b?
% expected result 0.5


*/
