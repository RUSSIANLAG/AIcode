/*a comment*/
isaLink(mammal, animal).
isaLink(reptile, animal).
isaLink(bird, animal).
isaLink(fish, animal).
isaLink(whale, mammal).
isaLink(dog, mammal).
isaLink(cat, mammal).
isaLink(canary, bird).
isaLink(penguin, bird).
isaLink(chicken, bird).
isaLink(shark, fish).
isaLink(retriever, dog).
isaLink(golden_retriever, retriever).
isaLink(poodle, dog).
isaLink(tabby, cat).
isaLink(robin, canary).
isaLink(emperor_penguin, penguin).

leaf(X) :- not isaLink(Y,X).
sibling(X,Y) :- isaLink(X, Z), isaLink(Y, Z), not X=Y.
grandParent(X, Y) :- isaLink(X, Z), isaLink(Z, Y).
isa(X,Y) :- X=Y.
isa(X,Y) :- isaLink(X, Z), isa(Z, Y).
child(A,Z) :- isaLink(A,Z).
child(X,Y) :- isaLink(X,P), child(P,Y).
moreSpecific(X,Y,Z) :- child(A,Z), isa(X,A), isa(Y,A).
mostSpecificSubsumer(X,Y,Z) :- isa(X,Z), isa(Y,Z), not moreSpecific(X,Y,Z).