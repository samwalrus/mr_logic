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
            numlist(1,10,L1),
            maplist(al,L1,List)),
        1,List,[[V]-_],[]).