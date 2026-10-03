male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(abraham, homer).

parent(mona, herb).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).

father(Father, Child) :-
    parent(Father, Child), male(Father).

mother(Mother, Child) :-
    parent(Mother, Child), female(Mother).

son(Son, Parent) :-
    parent(Parent, Son), male(Son).

daughter(Daughter, Parent) :-
    parent(Parent, Daughter), female(Daughter).

brother(Brother, Sibling) :-
    male(Brother), parent(Parent, Brother),
    parent(Parent, Sibling), Brother \= Sibling.

sister(Sister, Sibling) :-
    female(Sister), parent(Parent, Sister),
    parent(Parent, Sibling), Sister \= Sibling.


grandfather(Grandfather, Grandchild) :-
    father(Grandfather, Parent), parent(Parent, Grandchild).

aunt(Aunt, Child) :-
    sister(Aunt, Parent), parent(Parent, Child).

uncle(Uncle, Child) :-
    brother(Uncle, Parent), parent(Parent, Child).

cousin(Person, Cousin) :-
    parent(Parent1, Person), parent(Parent2, Cousin),
    Parent1 \= Parent2,
    (brother(Parent1, Parent2) ; sister(Parent1, Parent2)),
    Person \= Cousin.

% Base case
ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Descendant).

% Recursive case
ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Middle), ancestor(Middle, Descendant).
