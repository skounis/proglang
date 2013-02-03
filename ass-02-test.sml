(* Dan Grossman, Coursera PL, HW2 Provided Tests *)
use "ass-02.sml";

fun assert(result, expected) =
    if result = expected
    then true
    else false

(* test cases for  all_except_option function *)
val tc_01 = assert( filter("3", ["1","2","3","4","5"]),["1","2","4","5"]) 
val tc_02 = assert( exist_in_list("3", ["1","2","3","4","5"]),true) 
val tc_03 = assert( exist_in_list("6", ["1","2","3","4","5"]),false) 

(* test cases for get_substitutions1 function *)
val tc_04 = assert( get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred"), ["Fredrick","Freddie","F"])
val tc_05 = assert( get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff"), ["Jeffrey","Geoff","Jeffrey"])

(* test cases for get_substitutions2 function *)
val tc_06 = assert( get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred"), ["Fredrick","Freddie","F"])
val tc_07 = assert( get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff"), ["Jeffrey","Geoff","Jeffrey"])

(* test cases for similar_names function *)
(* val tc_08 = map_names( {first="Fred", middle="W", last="Smith"},["Fredrick","Freddie","F"]) *)
val tc_09 = assert( similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}), 
		    [{first="Fred", last="Smith", middle="W"},
		     {first="Fredrick", last="Smith", middle="W"},
		     {first="Freddie", last="Smith", middle="W"},
		     {first="F", last="Smith", middle="W"}] )
			
(* These are just two tests for problem 2; you will want more.

   Naturally these tests and your tests will use bindings defined 
   in your solution, in particular the officiate function, 
   so they will not type-check if officiate is not defined.
 *)


fun provided_test1 () = (* correct behavior: raise IllegalMove *)
    let val cards = [(Clubs,Jack),(Spades,Num(8))]
	val moves = [Draw,Discard(Hearts,Jack)]
    in
	officiate(cards,moves,42)
    end

fun provided_test2 () = (* correct behavior: return 3 *)
    let val cards = [(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)]
	val moves = [Draw,Draw,Draw,Draw,Draw]
    in
 	officiate(cards,moves,42)
    end

(* test cases for card_color function *)
val tc_10 = assert ( card_color(Clubs,Jack), Black)
val tc_11 = assert ( card_color(Diamonds,Jack), Red)

(* test cases for card_color function *)
val tc_12 = assert ( card_value(Clubs,Jack), 10)
val tc_13 = assert ( card_value(Diamonds,Queen), 10)
val tc_14 = assert ( card_value(Clubs,Ace), 11)
val tc_15 = assert ( card_value(Diamonds,Num(5)), 5)

(* test cases for card_color function *)
exception NoCardFoundException
val tc_16 = assert( remove_card([(Clubs,Jack),(Diamonds,King),(Spades,Ace)],(Clubs,Jack),NoCardFoundException), [(Diamonds,King),(Spades,Ace)] )
(* val tc_17 = remove_card([(Clubs,Jack),(Diamonds,King),(Spades,Ace)],(Clubs,Ace),NoCardFoundException) *)
val tc_18 = assert( remove_card([(Clubs,Jack),(Diamonds,King),(Spades,Ace)],(Diamonds,King),NoCardFoundException), [(Clubs,Jack),(Spades,Ace)])

(* test cases for all_same_color function *)
val tc_19 = assert ( all_same_color([(Clubs,Jack),(Diamonds,King),(Spades,Ace)]), false)
val tc_20 = assert ( all_same_color([(Hearts,Jack),(Diamonds,King),(Hearts,Ace)]), true)
val tc_21 = assert ( all_same_color([(Clubs,Jack),(Spades,King),(Spades,Ace),(Spades,Jack)]), true)

(* test cases for sum_card function *)
val tc_22 = assert ( sum_cards([(Clubs,Jack),(Spades,King),(Spades,Ace),(Spades,Jack)]), 41)
val tc_23 = assert ( sum_cards([(Clubs,Jack),(Spades,King),(Spades,Ace),(Spades,Num(2))]), 33)

(* test cases for core function *)
val tc_24 = score([(Clubs,Jack),(Spades,King),(Spades,Ace),(Spades,Num(2))], 3)

(* test cases for the game *)
(* val tc_25 = provided_test1() *)
val tc_26 = provided_test2()

