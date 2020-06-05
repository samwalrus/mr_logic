% Empty with mcintyre loaded
:- use_module(library(mcintyre)).

:- mc.

:- begin_lpad.
seq1([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]).
seq2([a,b,c,d,e,f,g,h,i,j,k,l,m,n,o]).

cross(X):-
    seq1(One),
    seq2(Two),
    seq1_seq2_cross(One,Two,X).

seq1_seq2_cross([],[],[]).
seq1_seq2_cross(One,Two,[New|Cross]):-
    mynumber(Seglength0),
    seglength_seq_use(Seglength0,One,Seglength),
    length(Seg1,Seglength),
    length(Seg2,Seglength),
    append(Seg1,R1,One),
    append(Seg2,R2,Two),
    random_in_in(New,Seg1,Seg2),
    seq1_seq2_cross(R1,R2,Cross).

random_in_in(X,X,Y):0.5; random_in_in(Y,X,Y):0.5.


al(C,0):0.5 ; al(C,1):0.5.
mynumber(3):0.5 ; mynumber(2):0.2 ; mynumber(6):0.3.



%if seg length greater than remaining, set length to one.
seglength_seq_use(X,Y,1):-
    length(Y,Z),
    X > Z.
seglength_seq_use(X,Y,X):-
    length(Y,Z),
    X =< Z.

:- end_lpad.

/** <examples> Your example queries go here, e.g.

?- mc_sample_arg(cross(X),1,X,V,[]).
?- length_haplotype(10,H).

*/
length_haplotype(L,V):-
	mc_sample_arg(
        (length(List,L),
            numlist(1,L,L1),
            maplist(al,L1,List)),
        1,List,[[V]-_],[]).

%population structure
%normally asssume random mating in population
%say an island occurs
%such that within island population randomly mates
%and large continent population randomly mates
%compare number of hetrozygotes in 3 (all,big,small) and all random mating
%number of hetrozygotes expected to go down in stratified population
%If islands have differnt food avail then the effect on bmi of a hetorzygot
%will be not corrects
%heidy weinburg is some measure of this
%If we do a simulation big enough then do pca on genotypes, does first pc correspond to our structures?
%more info https://www.ucl.ac.uk/~ucbhdjm/courses/b242/MigEvol/MigEvol.html


%create random population of haplotype pairs
length_pair_haplotypes(S,H1-H2):-
 	length_haplotype(S,H1),
    length_haplotype(S,H2).
length_size_population(L,S,P):-
    length(P,S),
    maplist(length_pair_haplotypes(L),P).
    
%randomly breed in whole population for X generations.
pop1_gens_pop2(P,0,P).
pop1_gens_pop2(P,G,[Cross1-Cross2|P2]):-
    G>0,
    random_pair_from_pop(Pair1-Pair2,P),
    seq1_seq2_cross(Pair1,Cross1),
    seq1_seq2_cross(Pair2,Cross2),
    G2 is G-1,
    pop1_gens_pop2(Pair).
%Compare initial snp stats

%Then do the same with islands




