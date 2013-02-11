fun same_string(s1 : string, s2 : string) =
    s1 = s2

fun all_except_option (s,xs) =
    case xs of
	[] => NONE
      | x::xs' => if same_string(s,x)
		  then SOME xs'
		  else case all_except_option(s,xs') of
			   NONE => NONE
			 | SOME y => SOME(x::y)

fun all_except_option2 e =
    let
	(* check to see if the element is in the list  *)
	fun is_in_list e =
	    case e of
		(_,[]) => false
	      | (x,hd::tl) => if same_string(x,hd)
			      then true
			      else is_in_list(x,tl)
	(* remove the element from the list  *)
	fun remove_element e = 
	    case e of
		(_,[]) => []
	      | (x, hd::tl) => if same_string(x,hd)
			       then remove_element(x,tl)
			       else hd::remove_element(x,tl)
    in
	case is_in_list(e) of
	    false => NONE
	  | true => SOME (remove_element(e))
    end
