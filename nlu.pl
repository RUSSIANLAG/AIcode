/* DATABASE */
person(ann). person(robert). person(philip). person(marc).
person(tom). person(michael). person(claire). person(sue).
person(sam). person(philip). person(john). person(michelle).
person(lisa). person(jane). person(ben). person(peter).

city(toronto). city(losAngeles). city(scarborough).
city(markham). city(sanFrancisco). city(montreal).
city(vancouver). city(richmondHill). city(boston).
city(ottawa). city(florida).

bank(rbc). bank(metro_credit_union). bank(scotia_bank).
bank(td). bank(cibc). bank(bank_of_montreal). bank(national_bank_of_canada).

country(canada). country(usa).

gender(ann, female).
gender(robert, male).
gender(ben, male).
gender(marc, male).
gender(tom, male).
gender(michael, male).
gender(claire, female).
gender(sue, female).
gender(sam, male).
gender(philip, male).
gender(john, male).
gender(michelle, female).
gender(lisa, female).
gender(jane, female).
gender(peter, male).

lives(philip, richmondHill).
lives(ann, markham).
lives(marc, toronto).
lives(tom, vancouver).
lives(michael, florida).
lives(claire, sanFrancisco).
lives(sue, toronto).
lives(sam, scarborough).
lives(john, markham).
lives(michelle, ottawa).
lives(lisa, boston).
lives(robert, boston).
lives(ben, losAngeles).
lives(peter, toronto).

location(scarborough, canada).
location(markham, canada).
location(sanFrancisco, usa).
location(montreal, canada).
location(toronto, canada).
location(vancouver, canada).
location(richmondHill, canada).
location(losAngeles, usa).
location(boston, usa).
location(ottawa, canada).
location(florida,usa).

location(rbc,toronto).
location(td,toronto).
location(cibc, ottawa).
location(metro_credit_union, sanFrancisco).
location(scotia_bank, vancouver).
location(bank_of_montreal, montreal).
location(national_bank_of_canada, ottawa).
location(metro_credit_union, markham).
location(rbc, montreal).
location(bank_of_montreal, toronto).

account(12, ann, metro_credit_union, 2505).
account(13, robert, rbc, 50000).
account(8, ann, cibc, 1000).
account(18, ann, cibc, 5300).
account(9, ben, rbc, 50).
account(1, marc, bank_of_montreal, 2000).
account(11, tom, national_bank_of_canada, 1000).
account(23, michael, td, 900).
account(14, claire, scotia_bank, 1500).
account(21, sue, scotia_bank, 3000).
account(45, sam, bank_of_montreal, 5000).
account(50, philip, rbc, 1490).
account(51, john, td, 1500).
account(46, michelle, bank_of_montreal, 10000).
account(16, lisa, metro_credit_union, 1010).
account(19, jane, td, 10803).
account(99, peter, td ,20000).

created(12, ann, metro_credit_union, 8, 2018).
created(13, robert, rbc, 6, 2019).
created(8, ann, cibc, 6, 2019).
created(18, ann, cibc, 5, 2019).
created(9, ben, rbc, 10, 2009).
created(1, marc, bank_of_montreal, 8, 2019).
created(11, tom, national_bank_of_canada, 5, 2009).
created(23, michael, td, 8, 2019).
created(14, claire, scotia_bank, 10, 2005).
created(21, sue, scotia_bank, 7, 2001).
created(45, sam, bank_of_montreal, 12, 2000).
created(50, philip, rbc, 9, 1995).
created(51, john, td, 9, 1990).
created(46, michelle, bank_of_montreal, 5, 2006).
created(16, lisa, metro_credit_union, 8, 2008).
created(19, jane, td, 1, 2008).
created(99, peter, td, 7, 2018).

/* LEXICON */

article(a). article(an). article(any). article(the).

common_noun(city, X) :- location(X,Country).
common_noun(man, X) :- person(X), gender(X, male).
common_noun(woman, X) :- person(X), gender(X, female).
common_noun(account, X) :- account(X,Name,Bank,Balance).
common_noun(bank, X) :- account(Number,Name,X,Balance).
common_noun(person, X) :- person(X).
common_noun(balance, X) :- account(Number,Name,Bank,X).
common_noun(owner, X) :- account(Number,X,Bank,Balance).
common_noun(american,X) :- lives(X,City), location(City,usa).
common_noun(canadian,X) :- lives(X,City), location(City,canada).

adjective(american, X) :- lives(X, City), location(City, usa).
adjective(american, X) :- account(Number,Name,X,Balance), location(X,City), location(City, usa).
adjective(canadian, X) :- lives(X, City), location(City, canada).
adjective(canadian, X) :- account(Number,Name,X,Balance), location(X,City), location(City, canada).
adjective(male, X) :- person(X), gender(X, male).
adjective(female, X) :- person(X), gender(X, female).
adjective(local, X) :- account(Number,Name,X,Balance), location(X,City), location(City,canada).
adjective(foreign, X) :- lives(X, City), location(City, Country), not Country = canada.
adjective(small, X) :- account(X,Name,Bank,Balance), Balance < 1000.
adjective(medium, X) :- account(X,Name,Bank,Balance), Balance >= 1000, Balance =< 10000.
adjective(large, X) :- account(X,Name,Bank,Balance), Balance > 10000.
adjective(old, X) :- created(X,Name,Bank,Month,Year),  Year < 2019.
adjective(recent, X) :- created(X,Name,Bank,Month,2020).

preposition(of, X, Y) :- account(Y,Name,Bank,X). /*the balance of an account*/
preposition(of, X, Y) :- account(X,Y,Bank,Balance). /*the account of a person*/
preposition(of, X, Y) :- account(Y,X,Bank,Balance). 
preposition(from, X, Y) :- person(X), lives(X,Y). /*a person from a city*/
preposition(from, X, Y) :- person(X), lives(X,Z), location(Z,Y). /*a person from a country*/
preposition(in, X, Y) :- location(X,Y). /*a city in a country*/ 
preposition(in, X, Y) :- account(X,Name,Y,Balance). /*an account in a bank*/
preposition(in, X, Y) :- account(Number,Name,X,Y), location(X,City), location(City,Country). /*a bank in a country*/
preposition(in, X, Y) :- account(X,Name,Bank,Y), location(Bank,City), location(City,Country). /*a bank account in a country*/
preposition(with, X, Y) :- person(X), account(Y,X,Bank,Balance). /*a person with an account*/
preposition(with, X, Y) :- account(Y,Name,Bank,Balance), location(Bank,X). /*An account in a country*/
preposition(with, X, Y) :- account(Y,Name,X,Balance). /*bank with an account*/
preposition(with, X, Y) :- account(X,Name,Bank,Y). /*a bank with a balance*/
preposition(between,Balance,X,Y) :- account(Number,Name,Bank,Balance), number(X), number(Y), Balance >= X, Balance =< Y.

%any word that is not used above
proper_noun(X) :- city(X).
proper_noun(X) :- country(X).
proper_noun(X) :- bank(X).
/******************* parser **********************/

what(Words, Ref) :- np(Words, Ref).

/* Noun phrase can be a proper name or can start with an article */

np([Name],Name) :- proper_noun(Name).

np([Art|Rest], Who) :- article(Art), not Art = the, np2(Rest, Who).
np([the|Rest], Who) :- np2(Rest, Who), not (np2(Rest, Who2), not Who = Who2).

np2([Adj|Rest],Who) :- adjective(Adj,Who), np2(Rest, Who).
np2([Noun|Rest], Who) :- common_noun(Noun, Who), mods(Rest,Who).


/* Modifier(s) provide an additional specific info about nouns.
   Modifier can be a prepositional phrase followed by none, one or more
   additional modifiers.  */

mods([], _).
mods(Words, Who) :-
	appendLists(Start, End, Words),
	prepPhrase(Start, Who),	mods(End, Who).

prepPhrase([Prep|Rest], Who) :-
	preposition(Prep, Who, Ref), np(Rest, Ref).

prepPhrase([between,Ref1,and,Ref2|Rest], What) :- 
	preposition(between, What, Ref1, Ref2), 
	np(Rest, What).	
	
prepPhrase([between,Ref1,and,Ref2|Rest], What) :- 
	preposition(between, What, Ref1, Ref2).	
	
appendLists([], L, L).
appendLists([H|L1], L2, [H|L3]) :-  appendLists(L1, L2, L3).

recursive(L1,L2)