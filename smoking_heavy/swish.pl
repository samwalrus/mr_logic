% Empty with pita loaded

:- use_module(library(mcintyre)).

:- mc.
:- begin_lpad.

p(Var):poisson(Var,6).

g(X):gaussian(X,0, 1).

cigs_smoked(X):-p(Var),between(1,Var,X).

%%Relational logistic regression

cancer:P :- setof(Cig_ID,cigs_smoked(Cig_ID),Cigs),
            length(Cigs,L),
            w0(W0),
            w1(W1),
            X is W0 +W1*L,
            sigmoid(X,P).

:- end_lpad.

w0(0.2).
w1(20).

sigmoid(X,Value):-
    Value is 1/(1+exp(-X)).
/** <examples> Your example queries go here, e.g.

?- mc_prob(p(3),Prob).

?- bdd_dot_string(query,BDD,Var).

*/
