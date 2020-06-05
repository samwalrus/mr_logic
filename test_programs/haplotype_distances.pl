% Empty with mcintyre loaded
:- use_module(library(mcintyre)).
:- use_module(library(clpfd)).
:- mc.

:- begin_lpad.

% here your LPAD

:- end_lpad.

/** <examples> Your example queries go here, e.g.

?- mc_sample(query,1000,Prob).
?-pair(H1a-H1b),generate_alternatives(N1,N2),dif_count(H1a-H1b,N1-N2,Count,Difs).

*/

%switch distance of haplotype pairs p277 on probablistic ilp book

% Compute the number of switches that are needed 
% to transform a haplotype pair to another haplotype 
% pair that corresponds to the same genotype

% a switch between markers i and i+1, transforms the pair {h1, h2}
%{h1[1,i]


pair([1,1,1,1]-[1,0,1,0]).

one_two_sum(X,Y,Z):-
    Z #= X+Y.
happair_genotype(One-Two,Genotype):-
    maplist(one_two_sum,One,Two,Genotype).
    

generate_alternatives(N1,N2):-
    pair(X), 
    happair_genotype(X,G),
    happair_genotype(N1-N2,G),
    append(N1,N2,X2),
    X2 ins 0..1, label(X2).

dif_t(X,Y,1):-
    dif(X,Y).
dif_t(X,X,0).

v_v_pair(V1,V2,V1-V2).

dif_count(H1a-H1b,H2a-H2b,Count,Difs):-
    maplist(v_v_pair,H1a,H1b,Pairs1),
    maplist(v_v_pair,H2a,H2b,Pairs2),
    maplist(dif_t,Pairs1,Pairs2,Difs),
    sumlist(Difs,Count).
    
    





