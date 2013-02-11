(* Dan Grossma, Coursera PL, HW2 Provided Tests *)
use "ass-03.sml";

fun assert(result, expected) =
    if result = expected
    then true
    else false
    

(* test cases for only_capitals function *)
val tc_01 = assert( only_capitals (["John","smith","Jack","Noris", "jeremy"]), ["John","Jack","Noris"])  

(* test cases for longest_string1 function *)
val tc_02 = assert( longest_string1 (["John","smith","Jack","Noris", "jeremy"]), "jeremy")
val tc_03 = assert( longest_string1 (["John","jeremy", "smith","Jack","Noris"]), "jeremy")
val tc_04 = assert( longest_string1 (["John","jeremy", "smith","Jack","jeremo"]), "jeremy")

(* test cases for longest_string2 function *)
val tc_05 = assert( longest_string2 (["John","smith","Jack","Noris", "jeremy"]), "jeremy")
val tc_06 = assert( longest_string2 (["John","jeremy", "smith","Jack","Noris"]), "jeremy")
val tc_07 = assert( longest_string2 (["John","jeremy", "smith","Jack","jeremo"]), "jeremo")

(* test cases for longest_string3 function *)
val tc_08 = assert( longest_string3 (["John","smith","Jack","Noris", "jeremy"]), "jeremy")
val tc_09 = assert( longest_string3 (["John","jeremy", "smith","Jack","Noris"]), "jeremy")
val tc_10 = assert( longest_string3 (["John","jeremy", "smith","Jack","jeremo"]), "jeremy")

(* test cases for longest_string4 function *)
val tc_11 = assert( longest_string4 (["John","smith","Jack","Noris", "jeremy"]), "jeremy")
val tc_12 = assert( longest_string4 (["John","jeremy", "smith","Jack","Noris"]), "jeremy")
val tc_13 = assert( longest_string4 (["John","jeremy", "smith","Jack","jeremo"]), "jeremo")

(* test cases for longest_capitalized function *)
val tc_14 = assert( longest_capitalized (["John","smith","Jack","Noris", "jeremy"]), "Noris")

(* test cases for rev_string function *)
val tc_15 = assert( rev_string "Jack Noris", "siroN kcaJ")

(* test cases for first_answer function *)
fun f x = if x > 10 then SOME x else NONE

val tc_16 = assert( first_answer f [2,3,5,11,4,2], 11)
val tc_17 = assert( (first_answer f [1,2,3,4,5,6,7]) handle NoAnswer => ~1, ~1)
val tc_18 = assert( first_answer f [5,20,1,2,20], 20); 
 
fun g x = if x > 10 then SOME [x] else NONE

val tc_20 = assert( all_answers g [], SOME []);
val tc_21 = assert( all_answers g [1,20,3,40,5,60,70], SOME [70,60,40,20]);
val tc_22 = assert( all_answers g [5,20,1,2,20], SOME [20,20]); 
val tc_23 = assert( all_answers g [5,3,1,2,2], NONE);

(* test cases for patterns 9 *)
val tc_23 = assert( count_wildcards(Wildcard), 1)
val tc_25 = assert( count_wildcards(TupleP [Wildcard, Wildcard, Wildcard]), 3)
val tc_24 = assert( count_wildcards(TupleP [Wildcard, ConstP 1]), 1)
val tc_26 = assert( count_wildcards(ConstructorP("foo", Wildcard)), 1)
val tc_27 = assert( count_wildcards(ConstructorP("foo", TupleP [Wildcard, Wildcard])), 2)

val tc_28 = assert( count_wild_and_variable_lengths(Wildcard), 1)
val tc_29 = assert( count_wild_and_variable_lengths(TupleP [Wildcard]), 1)
val tc_30 = assert( count_wild_and_variable_lengths(TupleP [Wildcard, Variable "foo"]), 4)
val tc_31 = assert( count_wild_and_variable_lengths(TupleP [Wildcard, Wildcard, Variable "foobar"]), 8)

val tc_32 = assert( count_some_var("foo", ConstructorP("foo", Wildcard)), 0)
val tc_33 = assert( count_some_var("foo", TupleP [Wildcard, Variable "foo", Variable "foo", Variable "bar"]), 2) 
val tc_34 = assert( count_some_var("bar", TupleP [Wildcard, Wildcard, Variable "foobar"]), 0)
val tc_35 = assert( count_some_var("foobar", TupleP [Wildcard, Wildcard, Variable "foobar"]), 1)
