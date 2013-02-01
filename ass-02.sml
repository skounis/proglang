(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* 1.a Write a function all_except_option, which 
   - takes a string and a string list. 
   - Return NONE if the string is not in the list, else return SOME lst 
     where lst is identical to the argument list except the string is not in it. 

   You may assume the string is in the list at most once. Use same_string, provided to you,
   to compare strings. Sample solution is around 8 lines.*)

(* return the list except the given element *)
fun filter (element : string, list : string list) =
    case list of 
	[] => []
	   | head::tail => let val a = filter(element, tail)
			   in
			       if same_string(head, element)
			       then a
			       else head::a
			   end
(* check if an element exists in the given list *)
fun exist_in_list (element : string, list : string list) =
    case list of
	[] => false
	   | head::tail => if same_string(element, head)
			   then true
			   else exist_in_list(element, tail)

fun all_except_option (element : string, list : string list) =
    if exist_in_list(element, list) 
    then SOME (filter(element, list))
    else NONE


(* 1.b Write a function get_substitutions1, which 
   - takes a string list list (a list of list of strings, the
     substitutions) and a string s and 
   - returns a string list. The result has all the strings that are in
     some list in substitutions that also has s, but s itself should not be in the result

   Assume each list in substitutions has no repeats. The result will have repeats if s 
   and another string are both in more than one list in substitutions *)
fun get_substitutions1 (x : string list list, s : string) =
    case x of
	[] => []
      | (x::xs) => case all_except_option(s,x) of
		       SOME v => v @ get_substitutions1(xs, s) 
		     | NONE => get_substitutions1(xs, s)
						 


(* 1.c Write a function get_substitutions2, which 
   - is like get_substitutions1 
     except it uses a tail-recursive local helper function. *)
fun get_substitutions2 (x : string list list, s : string) =
    let fun aux(x : string list list, s : string, acc) =
	    case x of
		[] => acc
	      | (x::xs) => case all_except_option(s,x) of
			       SOME v => aux(xs, s, acc @ v) 
			     | NONE => aux(xs, s, acc)
    in
	aux(x, s, [])
    end

(* 1.d Write a function similar_names, which 
   - takes a string list list of substitutions 
     (as in parts (b) and (c)) 
     and a full name of type {first:string,middle:string,last:string} and 
   - returns a list of full names (type {first:string,middle:string,last:string} list). 

   The result is all the full names you can produce by substituting for the first name 
   (and only the first name) using substitutions and parts (b) or (c). 
   The answer should begin with the original name (then have 0 or more other names) *)

type full_name = { first  : string, 
                   middle : string, 
                   last   : string }


fun map_names ({first=f, middle=m, last=l}, x : string list) =
    case x of
	[] => []
	   | head::tail => {first=head, middle=m, last=l}::map_names({first=f, middle=m, last=l}, tail)

fun similar_names (c : string list list, fname : full_name) =
   let
       val {first=f, middle=m, last=l} = fname
   in 
       fname::(map_names (fname,get_substitutions1(c, f))) 
   end



(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

(* 2.a Write a function card_color, which
   - takes a card and 
   - returns its color 
     (spades and clubs are black, diamonds and hearts are red). 
     Note: One case-expression is enough. *)
fun card_color (s,_) =
    case s of
	(Clubs | Spades) => Black
      | _  => Red 

(* 2.b Write a function card_value, which 
   - takes a card and 
   - returns its value 
     (numbered cards have their number as the value, aces are 11, everything else is 10). 
     Note: One case-expression is enough.*)
fun card_value (_,r) =
    case r of 
	Num(v) => v
      | Ace => 11
      |   _ => 10

(* 2.c Write a function remove_card, which 
   - takes a list of cards cs, a card c, and an exception e. 
   - It returns a list that has all the elements of cs except c. 

   If c is in the list more than once, remove only the first one.
   If c is not in the list, raise the exception e. You can compare cards with =. *)
fun remove_card(cs : card list, c : card, e) = 
    case cs of
	[] => raise e
      | head::tail => if (head = c ) 
		      then tail
		      else  head :: remove_card(tail, c, e)

(* 2.d Write a function all_same_color, which 
   - takes a list of cards and 
   - returns true if all the cards in the list are the same color. 
   
   Hint: An elegant solution is very similar to one of the functions using nested
   pattern-matching in the lectures. *)
fun all_same_color(cs : card list) = 
    case cs of
	[] => true
      | head::[] => true
      | head::(neck::rest) => (card_color(head) = card_color(neck)) andalso all_same_color(neck::rest)


(* 3.e Write a function sum_cards, which 
   - takes a list of cards and 
   - returns the sum of their values. 

   Use a locally defined helper function that is tail recursive. *)
fun sum_cards(cs : card list) = 
    let
	fun aux (cs, acc)=
	    case cs of
		[] => acc
	      | head::tail => aux (tail, acc + card_value(head)) 
    in
	aux(cs,0)
    end

			  
	
