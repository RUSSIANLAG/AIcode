
history(1, bad). history(2, unknown). history(3, unknown). history(4, unknown).
history(5, unknown). history(6, unknown). history(7, bad). history(8, bad).
history(9, good). history(10, good). history(11, good). history(12, good).
history(13, good). history(14, bad).

debt(1, high). debt(2, high). debt(3, low). debt(4, low).
debt(5, low). debt(6, low). debt(7, low). debt(8, low).
debt(9, high). debt(10, high). debt(11, high). debt(12, high).
debt(13, high). debt(14, high).

collateral(1, none). collateral(2, none). collateral(3, none). collateral(4, none).
collateral(5, none). collateral(6, adequate). collateral(7, none). collateral(8, adequate).
collateral(9, none). collateral(10, adequate). collateral(11, none). collateral(12, none).
collateral(13, none). collateral(14, none).

income(1, zero_to_15). income(2, fifteen_to_35). income(3, fifteen_to_35).
income(4, zero_to_15). income(5, over_35). income(6, over_35).
income(7, zero_to_15). income(8, over_35). income(9, over_35).
income(10, over_35). income(11, zero_to_15). income(12, fifteen_to_35).
income(13, over_35). income(14, fifteen_to_35).


rule(high) :- history(Person, unknown), debt(Person, high), risk(Person, high).
rule(high)  :- history(Person, unknown), debt(Person, low), collateral(Person, none), income(Person,zero_to_15), risk(Person, high).
rule(high)  :- history(Person, bad), collateral(Person, none), risk(Person, high).
rule(high)  :- history(Person, good), debt(Person, high), collateral(Person, none), income(Person,zero_to_15), risk(Person, high).

rule(moderate)  :- history(Person, unknown), debt(Person, low), collateral(Person, none), income(Person, fifteen_to_35), risk(Person, moderate).
rule(moderate)  :- history(Person, bad), collateral(Person, adequate), risk(Person, moderate).
rule(moderate)  :- history(Person, good), debt(Person, high), collateral(Person, none), income(Person,fifteen_to_35), risk(Person, moderate).

rule(moderate)  :- history(Person, unknown), debt(Person, low), collateral(Person, none), income(Person, over_35), risk(Person, low). 
rule(moderate)  :- history(Person, unknown), debt(Person, low), collateral(Person, adequate), risk(Person, low).
rule(moderate)  :- history(Person, good), debt(Person, high), collateral(Person, none), income(Person,over_35), risk(Person, low).
rule(moderate)  :- history(Person, good), debt(Person, high), collateral(Person, adequate), risk(Person, low).
rule(moderate)  :- history(Person, good), debt(Person, low), risk(Person, low).

%you need the rule to return low
%so you would put the risk atomic inside the statements and then create a new rule name
%Rule( ) -> history, debt, collateral, income, risk
%5and then from there you need it to return a value , low, medium high
/*
risk(Person, high) :- history(Person, unknown), debt(Person, high).
risk(Person, high) :- history(Person, unknown), debt(Person, low), collateral(Person, none), income(Person,zero_to_15).
risk(Person, high) :- history(Person, bad), collateral(Person, none).
risk(Person, high) :- history(Person, good), debt(Person, high), collateral(Person, none), income(Person,zero_to_15).

risk(Person, moderate) :- history(Person, unknown), debt(Person, low), collateral(Person, none), income(Person, fifteen_to_35).
risk(Person, moderate) :- history(Person, bad), collateral(Person, adequate).
risk(Person, moderate) :- history(Person, good), debt(Person, high), collateral(Person, none), income(Person,fifteen_to_35).

risk(Person, low) :- history(Person, unknown), debt(Person, low), collateral(Person, none), income(Person, over_35).
risk(Person, low) :- history(Person, unknown), debt(Person, low), collateral(Person, adequate).
risk(Person, low) :- history(Person, good), debt(Person, high), collateral(Person, none), income(Person,over_35).
risk(Person, low) :- history(Person, good), debt(Person, high), collateral(Person, adequate).
risk(Person, low) :- history(Person, good), debt(Person, low).*/



/*    
risk(Person, high) :- income(Person,zero_to_15).
risk(Person, high) :- history(Person, unknown), debt(Person, high).
risk(Person, high) :- history(Person, bad), collateral(Person, none).

risk(Person, moderate) :- history(Person, bad), collateral(Person, adequate).
risk(Person, moderate) :- income(Person,fifteen_to_35).

risk(Person, low) :- history(Person, unknown), debt(Person, low), collateral(Person, adequate).
risk(Person, low) :- history(Person, good), debt(Person, low).
risk(Person, low) :- history(Person, good), debt(Person, high), collateral(Person,adequate).
risk(Person, low) :- income(Person,over_35).*/